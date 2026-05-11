# 客户 001 · EASTRAGON / demo-a.com（视觉天花板重做实战）

> 时间：2026-04-26 ~ 2026-04-27
> 业务模型：**Solution Integrator**（贸易公司 Eastragon 2005 + 自有工厂 Demo-D 2015 + 整合供应链 + Customize R&D + Market Protection）
> 行业：PPE 听力防护
> 域名：demo-a.com（前期 demo-d.com 临时占位已 301）
> 服务器：Bluehost 共享主机 box5731.bluehost.com / 162.241.252.182
> 5 语种：en/es/fr/ar/ru
> 触发 v2.6 升级：客户老板反馈"很 low / 像 AI 半成品 / 完全没改变 / 小孩子都能做"

## 一、整个项目分阶段

### 阶段 1 · 域名搬迁（2026-04-26）
- demo-d.com (Hostinger) → demo-a.com (Bluehost)
- DNS：阿里云万网改 A 记录 47.88.13.175 (tradew) → 162.241.252.182
- SSL：Bluehost AutoSSL 自动续 Let's Encrypt R12（2026-07-26 到期）
- 旧 .htaccess 备份并删除（曾把 demo-a.com 强制 301 到 www.eastragonltd.com）
- demo-d.com 整站 301 → demo-a.com（保 30 天 50 imp）

### 阶段 2 · 海外品牌重定位（2026-04-27 早）
- Sian Protech / Sian Safety / 阿拉伯语 سيان بروتيك → **EASTRAGON**（约 50 处替换 + 5 i18n + 5 page schema）
- 公司名 Jiangyin Sian Plastic Protech → Eastragon International Trade Co., Ltd.
- Schema.org Organization name + alternateName 全切
- footer copyright 5 语种全改
- 客户提供龙亘 logo.png → sharp 切上 74% 部分作 logo-mark + 横排 + EASTRAGON 文字
- Schema foundingDate 2015-10-12 → 2005-01-01（Eastragon Trade 实际成立年份）
- Hero 副标 / advantages.factory / about timeline / hardcoded "2015" → "2005"（双层叙事：Eastragon 2005 贸易 + Demo-D 2015 工厂）
- about page 5 语种完全重做（基于客户 docx《About页面.docx》）：
  - companyTitle: "From a Weaving Town to the World — Hearing Protection Since 2005"
  - 创始人 Mr. Joshua 江阴织布之城故事 + 1999 觉察 + 2004 决心 + 2005 创立 + 2015 投资工厂双层结构
  - timeline 1999 / 2004 / 2005 / 2015 / 2018 / 2026 六节点
  - services 加 **Customize Your Own Products** + **Market Protection** 两条客户独有承诺

### 阶段 3 · v2.5 视觉对齐（2026-04-27 中）
- v2.5-visual-retrofit 12 步 SOP（FloatingCTA Intercom + ScrollProgress + Header backdrop-blur）
- 但**错配 Phase 6.4**：把 SectionBackdrop bold 加在深色 Stats / CTA section 上 → 浅色 overlay 盖死深蓝背景，文字"都看不清"

### 阶段 4 · v2.6 视觉天花板重做（2026-04-27 晚）

**客户反馈触发 5 大硬伤识别**：

> "视觉很 low / 看起来像 AI 生成的没有完成的半成品 / 其他图片也是一样,看起来非常单调,只有文字加白色背景,小孩子都能做,我认为这次的视觉完全没有任何改变和升级"

**深度研究**：派 Agent 抓 Hilti / Sika / Moldex / Bekaert / Harting / Eargasm 6 站，整理 12 条天花板模式。

**修复**（按 5 大硬伤）：

| 硬伤 | 客户原话定位 | 修复 |
|---|---|---|
| #1 白底+小icon+文字 | "小孩子都能做" | Advantages 6 卡 → Sika 风格全图背景（image-generator 生成 6 张 isometric vector 工业插画）+ aspect-[4/3] + from-white from-25% via-white/0 overlay |
| #2 SectionBackdrop 错配 | "都看不清了！" | 移除 Stats / CTA 上的 bold overlay；Stats 改深蓝多层渐变 + text-7xl/8xl font-black 大数字 |
| #3 占位区半成品感 | "看起来像 AI 生成的半成品" | 删除 "Trusted by Distributors" Client Logo wall + "What Our Buyers Say" 假证言 + 产品详情视频占位 |
| #4 商品图小不抠图 | "选择商品...商品抠出来放大一点" | 类目卡 aspect-[3/4] 高瘦大卡 + 蓝橙渐变 + dot pattern + 商品图占 62% + drop-shadow |
| #5 Hero 千篇一律 | "其他图片也是一样" | （v2.6 标记为 #23 QA 自动检测，本客户暂未做 Hero 差异化大改） |

**视觉素材生成**（image-generator gemini，全部 isometric vector + tech-light）：
- 6 张 advantages 背景：factory / mass-production / certified / oem-odm / export / delivery
- 9 张 blog 封面：industrial / snr-nrr / oem-vs-odm / private-label / ce-vs-ansi / supplier-criteria / foam-vs-silicone / complete-guide / top-10-china
- 1 张 about Factory 全景插画（产线 + QC + 仓库 + 橙色耳塞流穿越）

**Compare 功能删除**：B2B 工业品确实不需要"产品对比"。删 CompareBar.astro 组件 + 5 文件 checkbox。

## 二、最终 Commit 链（客户站独立 git）

| Commit | 说明 |
|---|---|
| `862e2a3` | feat: 域名搬迁 demo-d.com → demo-a.com + v2.5 视觉对齐 |
| `1dc6135` | docs: 域名搬迁 + v2.5 视觉升级交付文档同步 |
| `d1d302e` | fix: Header logo inline style 强制 48px |
| 后续多个 | feat: Phase 7 视觉天花板（删占位区 + Stats 修复 + 类目卡放大）/ Phase 8 视觉素材填充（Advantages 6 张 + Factory 1 张 + Compare 删）/ Phase 12 视觉素材深化（9 博客封面 + 类目卡重做 + Advantages overlay 修复） |

## 三、关键经验沉淀（已写入 v2.6 升级）

1. **B2B 客户老板的"丑"反馈 90% 不是审美主观偏差** — 而是 5 大固定硬伤之一
2. **"AI 半成品"= 占位 section 没删干净** — 比少 section 还难看
3. **"小孩子都能做" = 白底+小icon+文字三件套** — 改 emoji 为 SVG 不解决，要换全图背景
4. **SectionBackdrop bold 设计是给浅色 section 加视觉重量的** — 加在深色 = 错配
5. **isometric vector + tech-light 是 B2B 装饰性背景图最优解**（image-generator gemini）— 蓝橙品牌色 + 70% 留白 + 无人无字
6. **不要 AI 生成"工人戴产品在工厂/工地"假场景图** — chef-base 教训复习

## 四、待客户配合的事

- ⏳ Search Console：运营人员手工添加 demo-a.com 属性 + DNS TXT 验证 + 在 demo-d.com 发起地址变更通知
- ⏳ Logo 替换：客户提供过 logo.png（已上线）— 后续如果客户拍了真实工厂照可替换 about Factory 插画

## 五、Hero banner 差异化（待做 / 老 v2.6 #23 留给后续）

按 v2.6 #23 QA 检测标准，Hero / About / Blog / Contact 应有差异化。本次客户站没大改各页 hero（首页深蓝 + about 深蓝 + blog 深蓝），后续如客户继续反馈"翻页和没翻一样"再做。

---

*site-builder · 案例库 · 客户 001 EASTRAGON 视觉天花板重做实战 · 2026-04-27*
