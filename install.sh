#!/usr/bin/env bash
# 独立站建站-site-builder · 一键安装脚本
# 用法：bash install.sh

set -euo pipefail

RED=$'\033[0;31m'
GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
CYAN=$'\033[0;36m'
RESET=$'\033[0m'

say() { printf "%s%s%s\n" "$CYAN" "$1" "$RESET"; }
ok()  { printf "%s✓ %s%s\n" "$GREEN" "$1" "$RESET"; }
warn(){ printf "%s⚠ %s%s\n" "$YELLOW" "$1" "$RESET"; }
err() { printf "%s✗ %s%s\n" "$RED" "$1" "$RESET"; }

AGENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STARTER_DIR="$(cd "$AGENT_DIR/.." && pwd)/astro-b2b-starter"

say "== 独立站建站-site-builder · 一键安装 =="
echo "智能体目录：$AGENT_DIR"
echo "预期 Starter 目录：$STARTER_DIR"
echo

# -------- 1. 环境检查 --------
say "[1/6] 环境检查"

command -v node >/dev/null || { err "未找到 node。请先安装 Node.js 20+（推荐 nvm）"; exit 1; }
NODE_MAJOR=$(node -v | sed -E 's/v([0-9]+)\..*/\1/')
(( NODE_MAJOR >= 20 )) || { err "Node.js 版本需 >= 20，当前 $(node -v)"; exit 1; }
ok "Node.js $(node -v)"

command -v npm >/dev/null && ok "npm $(npm -v)" || { err "未找到 npm"; exit 1; }

if command -v claude >/dev/null; then
  ok "Claude Code CLI $(claude --version 2>/dev/null | head -1)"
else
  warn "未找到 claude CLI。请从 VSCode Marketplace 安装 Claude Code 插件"
fi

if command -v wrangler >/dev/null; then
  ok "wrangler $(wrangler --version 2>/dev/null | head -1)"
else
  warn "未找到 wrangler（可选，仅用于 Cloudflare Worker 部署）。安装：npm i -g wrangler"
fi
echo

# -------- 2. Starter 检查 --------
say "[2/6] astro-b2b-starter 检查"

if [ -d "$STARTER_DIR" ]; then
  ok "找到 starter：$STARTER_DIR"
  if [ -f "$STARTER_DIR/package.json" ]; then
    if [ -d "$STARTER_DIR/node_modules" ]; then
      ok "starter 已安装 node_modules"
    else
      warn "starter 未安装 node_modules"
      read -p "现在执行 'npm install'? (y/N) " yn
      if [[ $yn =~ ^[Yy]$ ]]; then
        (cd "$STARTER_DIR" && npm install)
        ok "starter npm install 完成"
      fi
    fi
  else
    err "starter 目录缺 package.json，结构异常"
    exit 1
  fi
else
  err "未找到 starter。请把 astro-b2b-starter/ 放在和本目录同级"
  echo "  期望路径：$STARTER_DIR"
  exit 1
fi
echo

# -------- 3. .env 引导 --------
say "[3/6] 环境变量配置"

if [ ! -f "$AGENT_DIR/.env" ]; then
  cp "$AGENT_DIR/.env.example" "$AGENT_DIR/.env"
  ok "已生成 .env（从 .env.example 复制）"
  warn "打开 .env 按需填写。建站本身所有字段都可选，但"
  warn "  - 没填 DEPLOY_SSH_* → 只能本地 build 看效果"
  warn "  - 没填 ANTHROPIC_API_KEY → AI Advisor 功能用不了"
else
  ok ".env 已存在，跳过生成"
fi
echo

# -------- 4. MCP 说明 --------
say "[4/6] MCP 服务"

cat <<'EOM'
本智能体依赖 5 个 MCP：
  - client-manager      客户档案 CRUD
  - deployer            一键构建 + 部署
  - seo-checker         SEO 审计（交付前必跑）
  - site-monitor        部署后可用性验证
  - content-tracker     建站里程碑记录

配置在 ~/.claude/mcp.json，格式见 https://modelcontextprotocol.io
社区 MCP 目录：https://www.npmjs.com/search?q=mcp-server

如果你有现成的 npm 包形式的 MCP，在 mcp.json 里这样写：

  {
    "mcpServers": {
      "client-manager": {
        "command": "npx",
        "args": ["-y", "@your-org/mcp-client-manager"]
      }
    }
  }

配置完成后重启 VSCode。
EOM
echo

# -------- 5. Claude Code 配置 --------
say "[5/6] Claude Code settings"

SETTINGS="$AGENT_DIR/.claude/settings.json"
if [ -f "$SETTINGS" ]; then
  ok "已存在 .claude/settings.json（MCP 权限骨架）"
  echo "  本骨架允许必要的 MCP 和基础 Bash 命令（npm run / bash scripts / wrangler）"
else
  warn ".claude/settings.json 丢失。请检查交付包完整性。"
fi
echo

# -------- 6. 最小自检 --------
say "[6/6] 最小自检"

cd "$AGENT_DIR"
[ -f "CLAUDE.md" ] && ok "CLAUDE.md 可读" || { err "缺少 CLAUDE.md"; exit 1; }
[ -f "业务叙事建模.md" ] && ok "业务叙事建模.md 可读" || warn "缺少业务叙事建模文档"
[ -f "叙事档案模板.md" ] && ok "叙事档案模板.md 可读" || warn "缺少叙事档案模板"

SKILL_COUNT=$(find .claude/skills -maxdepth 2 -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
if [ "$SKILL_COUNT" -ge 6 ]; then
  ok "智能体内技能 $SKILL_COUNT 个"
else
  warn "智能体内技能数异常（$SKILL_COUNT 个，预期 6）"
fi

# Starter build 测试（可选）
echo
read -p "是否执行 'starter npm run build' 做最小构建测试？(y/N) " yn
if [[ $yn =~ ^[Yy]$ ]]; then
  if (cd "$STARTER_DIR" && npm run build); then
    ok "starter 构建成功"
  else
    warn "starter 构建失败，请查看日志"
  fi
fi
echo

# -------- 总结 --------
say "== 安装完成 =="
cat <<EOM

下一步：
  1. 打开 .env 按需填值
  2. 在 ~/.claude/mcp.json 配置你启用的 MCP
  3. 用 VSCode 打开本目录，打开 Claude Code（Cmd+Esc）
  4. 输入："你好，请读 CLAUDE.md 并告诉我从 0 建一个 B2B 站需要什么"

第一个客户跑通：
  - 读 GETTING_STARTED.md 第 4 节（2-3 天闭环）
  - 禁止跳过业务叙事建模直接进入 build-execution

遇到问题：
  - 读 GETTING_STARTED.md 第 7 节 "常见问题"
  - 读 CLAUDE.md 第 2 章 "启动必读硬检查"

祝你建得稳。
EOM
