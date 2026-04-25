# 独立站建站-site-builder · 上手指南

本智能体是一位资深 B2B 独立站建站架构师，**2-3 天**交付一个多语言 × SEO 满分 × GEO 优化 × 转化系统 × AI 增强的询盘型独立站。

面向人群：外贸公司、独立站建站服务商、数字营销团队。

---

## 0. 三分钟速览

- 入口文件：**CLAUDE.md** — 智能体的身份、架构、9 技能调度、禁止行为
- 技能 9 个：**`.claude/skills/`**（6 建站内 + 3 全局运营共享）
- 起点模板：**同级目录 `../astro-b2b-starter/`**（所有新项目必须 fork 这个起步）
- 方法论：**业务叙事先行** — 先判定 7 业务模型 + 提取叙事单元 → 再决定页面结构
- 运行形态：在 VSCode + Claude Code 插件里对话使用

---

## 1. 系统要求

| 项目 | 要求 |
|---|---|
| 操作系统 | macOS 12+ / Linux / Windows 11 WSL2 |
| Node.js | v20+（推荐 nvm 管理） |
| VSCode | 最新版 |
| Claude Code 插件 | VSCode Marketplace 搜 "Claude Code" |
| Claude 账户 | [claude.ai](https://claude.ai)，推荐 Pro 或 Max 订阅 |
| Cloudflare 账户 | （可选，用于 AI 产品顾问 worker） |

---

## 2. 目录结构

建议把 site-builder + astro-b2b-starter 放在**同级**目录：

```
~/ai-agents/
├── site-builder/              ← 本智能体（独立 repo）
│   ├── CLAUDE.md
│   ├── .claude/skills/        ← 6 个建站技能
│   ├── 业务叙事建模.md
│   ├── 叙事档案模板.md
│   ├── 案例库/
│   ├── 客户版/                ← 交付给终端客户的操作教程
│   ├── 交付文档/              ← 上线后运维 + 客户操作教程
│   ├── .env.example
│   ├── install.sh
│   └── GETTING_STARTED.md
│
├── astro-b2b-starter/         ← 起点模板（独立 repo，禁止手搓新项目）
│   ├── src/
│   ├── package.json
│   └── ...
│
└── 客户项目/                  ← 你 fork starter 出来的每个客户网站
    ├── 客户A/website/
    ├── 客户B/website/
    └── ...
```

---

## 3. 安装流程

### 3.1 解压两个 repo 到同级目录

```bash
mkdir -p ~/ai-agents && cd ~/ai-agents
# 把 site-builder/ 和 astro-b2b-starter/ 都放进来
```

### 3.2 安装 starter 依赖

```bash
cd astro-b2b-starter
npm install
```

第一次安装大约 2-3 分钟。

### 3.3 配置环境变量

```bash
cd ../site-builder
bash install.sh
```

`install.sh` 会：
1. 检查 Node.js / VSCode / Claude Code 版本
2. 引导生成 `.env`（AI Advisor API key、Cloudflare Token 等，都可选）
3. 检查 `../astro-b2b-starter/` 是否能正常 `npm run build`

### 3.4 在 VSCode 里首次对话

1. 用 VSCode 打开 `site-builder/` 目录
2. 打开 Claude Code（`Cmd+Esc`）
3. 输入：`你好，请读 CLAUDE.md 并告诉我从 0 建一个 B2B 站需要什么`

智能体会返回完整流程，并问你具体客户信息。

---

## 4. 第一个客户：从零到上线

### 4.1 录入客户

```
帮我把新客户录入 client-manager：
- 公司名：Demo 精密机械
- 网站域名（上线后）：demo-machine.com
- 行业：heavy-equipment（重型设备）
- 业务模型：Pure Manufacturer（自营工厂）
- 目标市场：北美 + 欧洲
- 语种：EN / DE / ES
```

### 4.2 做业务叙事建模（v2.4 最重要）

```
Demo 精密机械 启动建站
```

智能体会走 `build-startup` 技能：

1. **读完 [业务叙事建模.md](业务叙事建模.md)** — 判定 7 业务模型
2. **采访你或客户** — 提取 3-5 个叙事单元（工厂规模 / 认证 / 独家工艺 / 交货周期 / 合作案例）
3. **产出《业务叙事档案.md》** — 套用 [叙事档案模板.md](叙事档案模板.md)
4. **叙事反推页面地图** — 哪些 section 要放首页，哪些独立页

**无叙事档案 = 禁止进入 build-execution**。

### 4.3 fork 模板 + 建站执行

```
Demo 精密机械 开始建站
```

智能体会：

1. `cp -r ../astro-b2b-starter/ ../客户项目/demo-machine/website/`
2. 填 `src/config/site.config.ts`（公司信息/语种/功能开关/品牌色）
3. 填 `src/data/products.ts`（产品数据 + wizardTags）
4. 填 `src/data/blog-posts.ts`（至少 3 篇）
5. 多语言翻译（英→德/西）
6. 写 llms.txt + 答案胶囊
7. SEO/转化配置
8. `npm run build` + QA 15 项自动检查

### 4.4 全面优化 + 行业强化

```
Demo 精密机械 全面优化
Demo 精密机械 行业强化
```

五维度审计 + B2B 最佳实践注入。

### 4.5 交付验收

```
Demo 精密机械 交付验收
```

智能体会：
- 跑 QA 12 项必检（WhatsApp 区号 / 电话一致性 / Schema / GA4 追踪 / IndexNow / 表单实测 / 根 URL verification / ...）
- 对比同行业竞品评分
- 生成《上线检查报告》

### 4.6 上线部署

```
部署 Demo 精密机械
```

智能体通过 `deployer` MCP 推到你的服务器（Hostinger / VPS / Cloudflare Pages）。

### 4.7 交接运营

```
Demo 精密机械 交接运营
```

走 `build-to-ops-handoff` 技能：写交接文档 + 基线报告 + 时间线记录，交给你的**运营人员**或**网站运营-web-ops 智能体**接手。

---

## 5. 核心能力地图

完整版看 [CLAUDE.md](CLAUDE.md) 第 5 章 "技能调度表"。精简版：

| 指令 | 技能 | 位置 |
|---|---|---|
| `[客户] 分析参考站 [URL]` | site-analyzer | 全局 |
| `[客户] 启动建站` | build-startup | 🏠 |
| `[客户] 抓取素材` | content-scraping | 🏠 |
| `[客户] 开始建站` | build-execution | 🏠 |
| `[客户] 行业强化` | industry-boost | 🏠 |
| `[客户] 全面优化` | full-optimization | 🏠 |
| `[客户] 交付验收` | delivery-review | 🏠 |
| `[客户] 交接运营` | build-to-ops-handoff | 全局 |
| `[客户] 扩展网站` | site-expansion | 全局 |
| `部署 [客户]` | deployer MCP | - |
| `QA检查` | `npm run qa` | 脚本 |

---

## 6. 硬检查清单（不读这个就开工 = 违规）

开工前 **7 项硬检查**（见 CLAUDE.md 第 2 章）：

1. 读完 CLAUDE.md
2. 用户意图确认（v2.4 满配 vs 快速 MVP）
3. 从 `../astro-b2b-starter/` fork（禁止手搓）
4. 通过 `client-manager` MCP 查客户档案
5. fetch 3-5 家同行业竞品网站（产出《竞品布局分析.md》）
6. 确认 7 套行业蓝图里对应哪一套
7. **业务叙事档案已产出**（v2.4 最关键防线）

交付前 **12 项 QA 必检**（见 CLAUDE.md 第 2 章）。

---

## 7. 常见问题

**Q：必须用 astro-b2b-starter 吗？能不能用 Next.js / WordPress？**
A：当前智能体只支持 Astro 起点。本智能体是围绕 starter 的"皮肤 + DNA 架构"设计的，换框架意味着重新写 9 个技能。

**Q：AI Advisor 是必需的吗？**
A：不是。它是一个**可选功能开关**（`features.aiAdvisor: true`）。不开启就不需要 Cloudflare Worker 和 Claude API key。

**Q：客户站用什么部署？**
A：smith-level 起步推荐 Hostinger（¥30/月含域名）；进阶推荐 Cloudflare Pages（免费）或 VPS。`deployer` MCP 支持 SSH + rsync 到任意 Linux 服务器。

**Q：交付后客户想自己改内容怎么办？**
A：看 [交付文档/客户操作教程-通用模板.md](交付文档/客户操作教程-通用模板.md) — 为每个新客户上线后复制一份、替换占位符后发客户。

**Q：v2.4 和 v2.3 最大区别？**
A：v2.4 强制走**业务叙事先行**。v2.3 有"模板复刻陷阱"（堆 11 section 客户反而觉得"像草稿"）。v2.4 的防线是：没有叙事档案不能进入 build-execution。

---

## 8. 下一步

1. 读 [CLAUDE.md](CLAUDE.md) — 完整架构 + 9 技能 + 禁止行为
2. 读 [业务叙事建模.md](业务叙事建模.md) — v2.4 最重要的前置步骤
3. 读 [叙事档案模板.md](叙事档案模板.md) — 产出档案时套用
4. 看 `../astro-b2b-starter/INSIGHTS.md`（如果有）— 了解 starter 的结构
5. 接第一个客户跑完第 4 节的 2-3 天闭环

祝你建得稳。
