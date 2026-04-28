---
name: v2.5-visual-retrofit
description: 把老客户站对齐到 starter v2.5/v2.6/v2.7 视觉默认 — v2.5 前沿视觉（FloatingCTA Intercom + ScrollProgress + Header backdrop-blur + Cards hover lift + SectionBackdrop bold + ExitIntent）+ v2.6 5 大视觉硬伤修复 + v2.7 7 业务模型 preset 判定。含品牌色适配、i18n 9 key 全语种填齐、QA #16-#34 验证、流量页保护
---

# 老站升级 v2.5/v2.6/v2.7 视觉默认 · 13 步 SOP

> 适用场景：已上线的客户站（fork 自 starter v2.0~v2.4）需要对齐到 starter 最新视觉默认配置。
>
> **不适用**：新建站（fork starter v2.7 即自带 — 走 build-startup / build-execution 流程）。
>
> 来源事件链：
> - 2026-04-25 客户反馈"白底单调"+"3 圆按钮所有站都这样" → v2.5 前沿视觉默认
> - 2026-04-27 客户反馈"很 low / 像 AI 半成品 / 完全没改变" → v2.6 5 大视觉硬伤 QA + v2.7 7 业务模型 preset

## Step 0 · v2.7 业务模型判定 + visual preset 选择（必做前置）

读《业务叙事档案.md》→ 判定客户属于 7 业务模型哪一个 → 查《经验库/业务模型库/业务模型x视觉风格匹配矩阵.md》→ 输出 `客户/<客户>/visual-preset-decision.md`。

**禁止**："上次客户用蓝橙就这次也蓝橙" / "上次 Intercom 浮动按钮就这次也 Intercom" — 必须基于业务模型选 preset。

| 业务模型 | preset | 关键差异 |
|---|---|---|
| Pure Manufacturer | `industrial-trust` | 工业蓝深沉 + 真车间照 + 禁插画 |
| Solution Integrator | `solution-cream` | Cream 底 + 行业切换 hero + 蓝橙双色 |
| OEM-ODM | `oem-neutral` | 中性灰 + 工业金 + 真产品特写 |
| Brand Owner | `brand-saturated` | 品牌饱和色 + lifestyle + mega type |
| Trader / Distributor | `trader-neutral` | 信任灰蓝 + 多品牌 logo 墙 |
| Material Supplier | `material-vertical` | Petrol/teal + 应用行业切片 portal |
| Service Provider | `service-editorial` | Cream + serif + 团队感 |

详见：starter `src/styles/theme-presets.css` 7 个 preset 完整规格。

完成 Step 0 后再进 Step 1（原 12 步流程）。

---

## 触发指令

| 运营人员说 | 我做 |
|---|---|
| `[客户] 升级 v2.5 视觉` | 走完整 12 步 |
| `[客户] 对齐前沿视觉` | 同上 |
| `把 [客户] 站浮动按钮换成 v2 / 加进度条 / 加 backdrop` | 走子集 — 但建议升完整套，浮动按钮单独换会与其他视觉脱节 |

---

## 启动前必读

1. **必须在客户目录下启动 Claude Code**（非 site-builder 目录）：
   ```
   cd ${WORKSPACE_ROOT}/客户/<客户目录>/website
   claude
   ```
   → 加载客户专属 CLAUDE.md + 客户 git 仓库。

2. **必须读建站智能体记忆**：
   - `~/.claude/projects/-home-hkf-ai-studio--------------site-builder/memory/project_v2_5_frontier_visual.md`（规格 + 必检三件 + 关键文件路径）
   - 三条 ops feedback memory 作为补充（feedback_section_backdrop_design / feedback_inquiry_baseline_components / feedback_floating_cta_v2_intercom_style）

3. **starter v2.5 在哪**：
   ```
   ${WORKSPACE_ROOT}/智能体/建站/astro-b2b-starter/src/components/core/{SectionBackdrop,FloatingCTA,ExitIntent,ScrollProgress}.astro
   ${WORKSPACE_ROOT}/智能体/建站/astro-b2b-starter/src/components/layout/Header.astro
   ${WORKSPACE_ROOT}/智能体/建站/astro-b2b-starter/src/styles/global.css
   ${WORKSPACE_ROOT}/智能体/建站/astro-b2b-starter/src/layouts/BaseLayout.astro
   ${WORKSPACE_ROOT}/智能体/建站/astro-b2b-starter/src/i18n/translations/en.ts (floatingCta.* 9 key 模板)
   ```

---

## 12 步流程

### 阶段 A · 预检（不做替换）

#### 步骤 1 — 线上现状

```
mcp__site-monitor__check_site domain=<客户域名>
mcp__seo-checker__check_seo url=<客户域名>
```

确认 SSL / 200 OK / 当前 SEO 分数。**这是基线**，升级后要回归这个分数（或更好）。

#### 步骤 2 — 当前在哪一代

```bash
cd ${WORKSPACE_ROOT}/客户/<客户目录>/website

# 判定方法
ls src/components/widgets/ 2>/dev/null              # 有 = v1/v2.0~v2.3
ls src/components/core/SectionBackdrop.astro 2>/dev/null  # 有 = v2.3+
grep -l "intensity" src/components/core/SectionBackdrop.astro 2>/dev/null  # 有 = v2.5
ls src/components/core/{FloatingCTA,ExitIntent,ScrollProgress}.astro 2>/dev/null  # 全有 = v2.5
```

| 当前代 | 处理 |
|---|---|
| v1 / v2.0~v2.2 | 走完整 12 步 |
| v2.3 (有 SectionBackdrop subtle) | 走步骤 4-12（保留 SectionBackdrop 但 + bold mode） |
| v2.4 (有 FloatingCTA v1 三圆按钮 + SectionBackdrop) | 走步骤 4-12 重点替换 FloatingCTA |
| **ops 已补丁版**（demo-a / demo-c）有 core/FloatingCTA v2 + 4 层 backdrop | **跳过到步骤 6**（只补 ScrollProgress + Header backdrop-blur + global.css hover lift） |

#### 步骤 3 — 流量页保护（v2.4 硬规则，不能跳）

```
mcp__search-analytics__gsc_search_performance site=<域名> days=28 dimension=page limit=200
```

**导出有 impressions > 0 的所有 URL**，标黄。任何升级动作（删 section / 改 URL / 改 layout）触及这些 URL 必须：
- 保留页面（最优）
- 或 301 → 最相关页（次优）
- **禁止裸删**（会丢权重）

> 来源：2026-04-18 客户 004 demo-b.com 误删 /en/blog/pva-glue-vs-epoxy-resin/，两天后发现 FR #1 流量页消失，浪费 2 天流量。

视觉升级**理论上不动 URL**，但合并 global.css 时若覆盖了客户特有 CSS、或 BaseLayout 改动影响了页面渲染，可能造成视觉退化 → 仍需此 baseline。

---

### 阶段 B · 替换 6 件套

#### 步骤 4 — 复制 4 个 core 组件

```bash
STARTER=${WORKSPACE_ROOT}/智能体/建站/astro-b2b-starter

# 直接覆盖（确认客户站这 4 个组件没有客户特有改动）
cp $STARTER/src/components/core/SectionBackdrop.astro src/components/core/
cp $STARTER/src/components/core/FloatingCTA.astro src/components/core/
cp $STARTER/src/components/core/ExitIntent.astro src/components/core/
cp $STARTER/src/components/core/ScrollProgress.astro src/components/core/
```

**例外**：如果客户站 SectionBackdrop 有自定义 variant 或 accent，**先 diff** 再合并：
```bash
diff src/components/core/SectionBackdrop.astro $STARTER/src/components/core/SectionBackdrop.astro
```

#### 步骤 5 — Header.astro 升级

**不要直接覆盖**（客户 Header 可能改过 nav 结构）。只**加两件**：

```diff
- <header class="fixed top-0 left-0 right-0 z-50 bg-bg-primary border-b border-border shadow-sm">
+ <header
+   id="site-header"
+   class="fixed top-0 left-0 right-0 z-50 bg-white/95 backdrop-blur-md border-b border-border/60 shadow-sm transition-shadow duration-200"
+   data-site-header
+ >
```

并在 `<script>` 块末尾加 scroll handler（参考 starter Header.astro 的 IIFE 那段）。

#### 步骤 6 — global.css 合并

**不要直接覆盖**（客户 global.css 可能有自定义动画/工具类）。**追加**这 3 段：

1. `#site-header.is-scrolled` 加深规则
2. `.bg-white.rounded-{lg|xl|2xl}` hover lift + brand glow（含 prefers-reduced-motion 兜底）
3. （可选）`.card-glass` 等 starter 已有的工具类

参考 starter `src/styles/global.css` 第 158 行后的 v2.5 三块。

#### 步骤 7 — BaseLayout 注入三件套

在客户站 `src/layouts/BaseLayout.astro` 加 import + 渲染：

```astro
---
// imports 块加：
import ScrollProgress from '../components/core/ScrollProgress.astro';
import FloatingCTA from '../components/core/FloatingCTA.astro';
import ExitIntent from '../components/core/ExitIntent.astro';
---

<body>
  <ScrollProgress />
  <slot />
  {!hideFloatingCTA && <FloatingCTA locale={locale} />}
  <ExitIntent locale={locale} />
  ...
</body>
```

#### 步骤 8 — 删旧 widgets/ + 删 pages/ 旧 import

```bash
# 删旧组件
rm -f src/components/widgets/FloatingCTA.astro src/components/widgets/ExitIntent.astro
rmdir src/components/widgets 2>/dev/null

# 批量删 pages 里的旧 import 和渲染（用 sed）
for f in $(grep -rln "components/widgets/FloatingCTA\|components/widgets/ExitIntent" src/pages/); do
  sed -i -E '/^import (FloatingCTA|ExitIntent) from .*\/widgets\/.+\.astro.*;$/d' "$f"
  sed -i -E '/^[[:space:]]*<(FloatingCTA|ExitIntent) locale=\{locale\} \/>[[:space:]]*$/d' "$f"
done

# 验证
grep -rE "FloatingCTA|ExitIntent" src/pages/ || echo "✅ pages 干净"
```

---

### 阶段 C · 适配（这步最容易漏）

#### 步骤 9 — i18n 9 key 全语种填齐

每个语种文件加 `floatingCta` 块：

```typescript
floatingCta: {
  trigger: '...',           // 默认胶囊文案 "Talk to Us"
  close: '...',
  title: '...',             // popup header 主标 "Need a quote..."
  subtitle: '...',          // popup header 副标
  waPromise: '...',         // WhatsApp 选项响应承诺 "Reply within 30 min..."
  emailSubject: '...',      // mailto 主题
  emailPromise: '...',
  inquiryTitle: '...',      // "Detailed Inquiry"
  inquiryPromise: '...',
  langBadge: '...',         // footer 多语种小标识 "We answer in EN/ES/..."
},
```

⚠️ **不能直接机翻 starter en.ts**：
- `langBadge` 必须列客户实际支持的语种（"We answer in English / Spanish / French"，看客户 i18n 配多少种）
- `waPromise` 的时区要写客户工作时区（中国客户 GMT+8，欧洲客户 CET）
- 阿语版本特别注意 RTL 标点

**漏一个语种 = 该语种页面浮动按钮显示 i18n key 字符串**（如 `floatingCta.trigger`）。

#### 步骤 10 — FloatingCTA 品牌色适配

starter 默认用 `from-primary-dark to-primary` 渐变，自动从客户 `--color-primary` 取色。**确认 site.config.ts 三个 token 已定**：

```typescript
// site.config.ts theme.brandColors 或 src/styles/global.css @theme
--color-primary: '#xxx';       // 主色（FloatingCTA 渐变 + ScrollProgress 渐变 + cards hover glow 都用它）
--color-primary-dark: '#xxx';  // 深一档
--color-accent: '#xxx';        // 强调色（ScrollProgress 末端 + amber 召唤点）
```

如果客户 brand 是单色（只 primary 没 accent），ScrollProgress 渐变会塌成单色 — 这时把 `--color-accent` 设成 primary 同色族的高亮（HSL +20°）。

**Demo-D**：plastic 行业，建议 navy + cyan 或 navy + amber。
**Demo-B**：化工材料，建议 deep blue + safety orange（参考 sika.com / henkel.com 的化工配色）。

#### 步骤 11 — site.config.ts 必检

```typescript
features: {
  ...
  exitIntent: true,  // v2.5 默认 true
}
```

⚠️ 如果客户明确说"不要弹窗"才改 false。

---

### 阶段 D · 验收发布

#### 步骤 12 — Build / QA / 部署 / 时间线 / Commit / Push public

```bash
# 1. 构建 + QA
npm run build           # 必须零错
npm run qa              # 第 9 项 (移动导航) + 第 10 项 (#16/#17/#18 v2.5 三检查) 必须全 ✅

# 2. 本地 dev 浏览器或 Playwright 截图（参考会话 c28c290 的做法）
npm run dev &
# 用 Playwright 截 7 张：top / popup / scrolled / mobile-top / mobile-popup / hover-card

# 3. 部署
mcp__deployer__deploy client_id=<客户ID>

# 4. 验证线上
mcp__site-monitor__check_site domain=<域名>
mcp__seo-checker__check_seo url=<域名>     # 分数不低于步骤 1 baseline

# 5. client-manager 时间线
mcp__client-manager__add_timeline client_id=<ID> milestone="v2.5 视觉默认对齐" detail="升级 FloatingCTA Intercom-style + ScrollProgress + Header backdrop-blur + Cards hover lift + SectionBackdrop bold + ExitIntent。QA #16/#17/#18 全 ✅"

# 6. commit (客户站独立 git)
git add -A && git commit -m "feat: 对齐 starter v2.5 前沿视觉默认配置"

# 7. 如果客户站推过 public release（询盘智能体订阅源），sync 一下
bash ${WORKSPACE_ROOT}/scripts/release-agent.sh <客户站 release 名>
```

---

## 常见坑（升级时必避）

1. **直接 cp 整个组件目录** — 客户 Header 可能改过 nav，覆盖会破坏导航。**永远只覆盖 4 个 core 组件**，Header / global.css / BaseLayout 走合并
2. **i18n 漏语种** — 浮动按钮显示 `floatingCta.trigger` 字符串。每语种文件都查一遍 `grep -l "floatingCta" src/i18n/translations/*.ts`，少于语种总数就漏了
3. **品牌色没设** — FloatingCTA 渐变默认 navy，跟客户品牌色不符。**改完先看 site.config.ts theme.brandColors / global.css `--color-primary`**
4. **没删 widgets/ 旧组件** — `npm run qa` 第 10 项 #16 会爆（fixed bottom-6 right-6 出现 ≥2 处）
5. **动了流量页 URL** — 步骤 3 没做。客户骂你两天前还能搜到，现在 404 了
6. **客户 002 / 002u 跳过步骤 4** — 它们已经被 ops 补丁过 core/FloatingCTA v2 了，再覆盖会重置成 starter 默认（可能 i18n 标识或品牌色不对）。要先 diff 再决定

---

## 已升级清单（建议升级时勾选）

| 客户 | 域名 | 当前代 | 升级状态 |
|---|---|---|---|
| 客户 001 Demo-D | <填> | <填> | ⬜ |
| 客户 002 Demo-C / demo-c | demo-c.com | ops 补丁版（v2 浮动 + 4 层 backdrop） | ⬜ 补 ScrollProgress + Header blur + global.css |
| 客户 002u Demo-A / demo-a | demo-a.com | ops 补丁版 | ⬜ 同上 |
| 客户 003 Demo-E | <填> | <填> | ⬜ |
| 客户 004 Demo-B | demo-b.com | <填> | ⬜（**注意流量页 /en/blog/pva-glue-vs-epoxy-resin/**） |
| 客户 005 | <填> | <填> | ⬜ |

---

## 完成定义（DoD）

- ✅ `npm run qa` 第 9 + 10 项全过（#16/#17/#18 v2.5 三检查）
- ✅ Playwright 7 张截图：桌面顶部 / popup / 滚动后 / hover 卡片 / 移动顶部 / 移动 popup / 全页
- ✅ 线上 SEO 分数 ≥ 升级前 baseline（步骤 1）
- ✅ client-manager 时间线写入"v2.5 视觉对齐"里程碑
- ✅ git commit + 客户站 public release（如有）已同步
- ✅ 流量页 URL 全保留（步骤 3 baseline 全在线上 200）

---

*独立站建站智能体 · 独立站技能库 · v2.5 视觉对齐技能 · 2026-04-26*
