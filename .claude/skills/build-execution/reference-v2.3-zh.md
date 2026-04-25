---
name: 建站执行
description: 项目启动完成后，基于 astro-b2b-starter 填充数据文件的分阶段建站流程（产品录入→图片处理→多语言→博客→SEO→构建验证）
---

# 建站执行技能 v2.4 — 叙事档案驱动的分阶段建站

> 适用场景：项目启动完成、素材就绪后，进入实际建站开发阶段。从模板复制到全站搭建完成。
> 使用者：独立站建站智能体（内部）
> 更新时间：2026-04（v2.3）→ **v2.4 升级**

---

## 🚨 v2.4 升级补丁

### 从"按蓝图铺 section"到"按叙事档案铺 section"

**v2.3 错法**：fork starter → 选行业蓝图 → SectionRenderer 自动铺 11 section → 填 data → 完工。结果 Demo-A v2 四十一千页但客户说乱。

**v2.4 对法**：fork starter → 读叙事档案 → 按档案第 4 节页面地图写 site.config.ts layout → 只铺档案批准的 section → 填 data。

### 必读前置

`客户/独立站-客户XXX/业务叙事档案.md` — 本技能所有步骤的唯一真相来源。未产出此档案 = 违规，回 build-startup。

### site.config.ts 填写规则（v2.4）

**layout 字段**：

```ts
// ❌ v2.3 错法
layout: blueprints['cold-chain']

// ✅ v2.4 对法 — 按叙事档案第 4 节手动写
layout: {
  home: [
    { type: 'hero', variant: 'image-overlay' },
    { type: 'solutions-grid', variant: 'by-buyer-type' },  // 叙事单元 1
    { type: 'value-prop', variant: 'numbered-4-cards' },   // 叙事单元 3
    { type: 'products', variant: 'by-category-group' },
    { type: 'cta', variant: 'split-form' }
  ],  // ≤ 7 个，每个能回答"这个客户为什么需要"
  productDetail: 'standard',  // 方形产品图必 standard，禁 full-width
}
```

**features 字段**：全部默认 false，按档案第 5 节逐个开

```ts
features: {
  productWizard: false,        // 默认关，≥30 SKU 才考虑开
  roiCalculator: false,        // 默认关，Solution Integrator 通常不开
  programmaticSEO: false,      // 默认关，需真实差异化内容源才开
  exitIntent: false,           // 默认关，B2B 询盘站通常不开
  // ...
}
```

### 每个 section 必过的"叙事支撑检查"

铺每个 section 前问三遍：

1. 档案第 2 节里有没有叙事单元点名要这个 section 承载它？
2. 如果是通用信任件（Hero/TrustBar/CTA/FAQ），是否有真实素材？
3. 如果没有叙事单元也没真实素材 → **删，不铺**

### 产品页布局选择（硬规则）

| 产品图类型 | 选 productDetail | 禁用 |
|---|---|---|
| 方形 1:1（控制台/瓶装/盒装/方形设备） | `standard` | ❌ `full-width`（会出大片空白，Demo-A 事件） |
| 横向 16:9 及以上（产线实拍/重型设备整机） | `full-width` | — |
| 竖向 3:4 以下（长条设备/包装） | `sidebar` | — |

### 视觉填充硬标准（v2.4）

- 所有 icon 字段**不用 emoji**，用 lucide / tabler / heroicons 组件名
- advantages / solutions / factory 类图片**必须真实照片**，没有真图 = 删该 section
- 首页 Section 间距按内容密度：内容少 `py-12` / 内容多 `py-20`
- `object-contain` + 深色背景的组合禁用（Demo-A FullWidth hero 的通图事件根因）

### 9 技能流程位置

```
build-startup（产叙事档案）
  → content-scraping（按档案扒素材）
    → 【本技能】build-execution（按档案铺 section 填 data）
      → industry-boost（补强档案认可的 section）
        → full-optimization（五维度 + MVP 对照）
          → delivery-review（去名称压力测试）
```

### 对照失败案例

- ❌ **Demo-A v2**：跳过叙事档案 → SectionRenderer 吃 cold-chain 蓝图 11 section → 删掉 v1 的 Who-We-Serve / Factory-Network / Solutions/[type] 三个核心叙事单元承载页 → 客户说乱

---

## 一、使用场景

- CLAUDE.md 已配置、素材已整理，准备开始编码
- 需要从标准模板创建新客户网站
- 分阶段推进建站，每阶段可预览验证

---

## 二、技术方案

### 技术栈

| 组件 | 技术选型 | 说明 |
|------|---------|------|
| 框架 | Astro（静态站生成器） | 零JS输出，加载极快 |
| 样式 | Tailwind CSS | 原子化CSS，体积小 |
| 语言 | TypeScript | 类型安全 |
| 部署 | Hostinger 共享主机 | 成本低，客户可自管 |
| 表单 | Web3Forms | 免费，无需后端 |
| 图片 | WebP 格式 | 体积小30%+ |

### 标准模板

已在 build-startup 阶段 fork 了 `astro-b2b-starter`，`site.config.ts` 已填好。建站执行阶段需要填写以下数据文件：

```
src/data/products.ts        ← 产品类目 + 产品数据 + wizardTags
src/data/blog-posts.ts      ← 3篇SEO博客文章（含多语言）
src/data/roi-config.ts      ← ROI计算器行业参数（设备商必填）
src/data/case-studies.ts    ← 案例展示数据（有素材时填）
src/i18n/translations/en.ts ← 英文文案（Hero/About/Quality定制内容）
src/i18n/translations/*.ts  ← 其他语言翻译
src/styles/global.css       ← @theme颜色（如需微调品牌色）
public/robots.txt           ← 替换 SITE_URL 为实际域名
public/llms.txt             ← 填写公司和产品结构化信息
```

**不需要修改的文件**（DNA层自动工作）：
- BaseLayout.astro — Schema/GA4/hreflang 自动从 config 读取
- 页面模板 — [locale] 动态路由自动生成所有语言
- 组件 — Header/Footer/FloatingCTA/ExitIntent 从 config 读取

---

## 三、分阶段建站流程 + 提示词

### 阶段0：页面布局实施（v2.3 模块化布局系统）

> 前提：build-startup 阶段已完成 starter fork + site.config.ts 配置 + **行业蓝图已选择** + **竞品分析已完成**

**v2.3 不再手写首页 HTML。** 首页使用 SectionRenderer 根据 `layout.home` 配置自动渲染。

```
1. 确认 site.config.ts 的 layout 配置：
   - 如果使用蓝图：layout: blueprints['heavy-equipment']
   - 如果自定义：layout.home = [{ type: 'hero', variant: 'split' }, ...]
   - 如果需要微调蓝图：在蓝图基础上增删 Section

2. 首页自动渲染（无需手写）：
   - src/pages/[locale]/index.astro 使用 SectionRenderer
   - SectionRenderer 读取 layout.home 数组，按顺序渲染 Section 变体
   - 27 种 Section 变体已内置，通过 config 选择组合

3. 产品详情页布局选择：
   - layout.productDetail = 'standard' | 'full-width' | 'sidebar'
   - 产品页自动使用对应的布局组件（Standard/FullWidth/Sidebar.astro）
   - DNA 层（Schema/FAQ/GEO/GA4/询盘表单）在所有布局中保持一致

4. 如果竞品分析发现需要行业特有模块（蓝图中没有的）：
   - 在 src/components/sections/ 下新建变体组件
   - 注册到 SectionRenderer 的 registry
   - 加入 layout.home 配置

5. 加载经验库（如有同行业经验）：
   - 检查 智能体/建站/经验库/行业经验/ 是否有同行业文件
   - 如果有 → 读取并应用其中的布局建议和踩坑记录
   - 如果没有 → 基于竞品分析从零设计，建站完成后创建经验文件

6. npm run build 验证零错误
```

**注意：DNA 层（BaseLayout/Schema/GA4/GEO/FloatingCTA/ExitIntent）绝对不动。只通过 config 选择布局变体。**

---

### 阶段1：产品数据录入

> 前提：阶段0 页面布局已完成，构建零错误

```
请将素材整理.md中的产品数据录入到 src/data/products.ts：

执行步骤：
1. 读取素材整理.md中的产品分类和产品列表
2. 在 products.ts 中填写 categories 数组（每个类目含多语言 names/descriptions）
3. 在 products.ts 中填写 products 数组，每个产品包含：
   - id/model/slug（slug 用 SEO 友好格式：model-product-name）
   - names/descriptions（所有语言）
   - specs（完整规格参数表）
   - features/applications/certifications
   - image（WebP路径，阶段2处理后填入）
   - wizardTags（如 features.productWizard=true，填写筛选维度）
4. 如果 features.roiCalculator=true，填写 src/data/roi-config.ts 行业参数
5. npm run build 验证零错误
4. 修改 astro.config.mjs：site → 客户域名
5. 修改 favicon.svg：rect fill 改为主色调
6. 运行 npm install && npm run build 验证零错误

完成后报告：页面数、构建是否成功、有无错误。
```

### 阶段2：图片处理

```
使用图片处理管线批量处理产品图片：

执行步骤：
1. 将客户提供的产品图片/从官网下载的图片放入 source-images/ 目录
2. 运行 npm run images（调用 scripts/convert-images.mjs）
3. 脚本自动执行：下载 → 压缩 → 转WebP → 按类目重命名 → 输出到 public/images/products/
4. 检查 image-manifest.json 确认所有图片已处理
5. 更新 products.ts 中的 image 字段为 WebP 路径
6. npm run build 验证零错误

注意：
- 图片最大宽度 1200px，质量 80%
- 命名格式：category-product-01.webp
- 小于 30KB 的原图可能模糊，标记让客户补拍
```

### 阶段3：多语言文案定制

```
请完成全站多语言文案定制，确保5种语言内容完整且行业相关。

执行步骤：

1. 修改 en.ts（英文文案 — 所有内容的基准）：
   - Hero标题和副标题 → 行业相关
   - Hero信任行 → Free Samples / Low MOQ / 24h Reply / OEM Available
   - 6项公司优势 → 行业定制（如：Advanced Manufacturing, Quality Certified, Global Export...）
   - Why Us 内容（6项优势 + 4个数据展示：年份、产能、出口比例、客户数）
   - 下单流程4步（Inquiry → Sample → Order → Delivery）
   - FAQ 6个问答 → 行业相关（MOQ、认证、交期、定制、样品、质量控制）
   - CTA Banner文案
   - About页面内容（公司介绍、里程碑、服务能力）
   - Contact页面文案

2. 翻译为其他4种语言（es/fr/ar/ru）：
   - 逐条翻译，不是机翻，要地道
   - 阿拉伯语注意RTL适配
   - 保持专业B2B语气

3. 博客标题和摘要翻译：
   - blogI18n 对象中添加5语言的标题和摘要
   - 正文保持英文（B2B行业标准）

4. 构建验证，确认所有语言页面正常渲染
```

### 阶段4：博客文章创建

```
请为客户网站创建3篇高质量的英文SEO博客文章。

客户行业：【行业】
目标关键词：【关键词列表】

文章要求：
1. 每篇1500-3000词英文
2. 面向海外B端采购商
3. 包含具体数据（每150-200词一个数据点）
4. 包含对比表格
5. 含小标题、列表、实操建议
6. 结尾有CTA引导询盘
7. 每篇有Article Schema结构化数据

建议文章方向：
- 第1篇：采购指南（How to Choose/Select...）
- 第2篇：产品对比（A vs B: Which is Better for...）
- 第3篇：行业趋势/最佳实践（Top X Tips for...）

同时在 blog.ts 中：
- 添加文章数据（title、slug、date、tags、excerpt、content）
- 添加 blogI18n 多语言标题和摘要（5种语言）

构建验证，确认博客列表页和文章页正常显示。
```

### 阶段4.1：文章发布前强制检查（每篇必须通过，未通过不能发布）

```
每篇博客文章完成后，必须逐项通过以下检查清单，全部通过才能发布上线。
任何一项未通过，必须修改后重新检查。

一、SEO检查（8项）
- [ ] 目标关键词在标题中出现
- [ ] 目标关键词在首段出现
- [ ] 目标关键词在至少1个H2中出现
- [ ] 文章长度1500词以上
- [ ] 有2-3个产品页内链
- [ ] 所有内链都有效（无404）
- [ ] 图片有alt文字
- [ ] 发布日期是真实日期（不是未来日期）

二、GEO检查（4项）
- [ ] 开头有清晰的问题定义
- [ ] 有FAQ部分（至少5个问题）
- [ ] FAQPage Schema已配置
- [ ] 有具体数据支撑观点

三、内容准确性检查（4项）
- [ ] 公司认证信息与网站一致（不多写）
- [ ] 产品参数与网站产品页一致
- [ ] 数字和数据有来源或限定词
- [ ] 竞品信息用保守表述

四、发布后必做（3项）
- [ ] 在Search Console请求索引这篇文章
- [ ] 发链接给客户确认内容准确
- [ ] 记录发布日期和目标关键词到内容日历

判定规则：
- 19项检查全部通过 → 可以发布
- 任何一项未通过 → 修改后重新检查，不得跳过
- SEO检查和GEO检查为硬性要求，不可降级
```

### 阶段5：生成 llms.txt + robots.txt

```
请为客户网站生成 llms.txt 文件，放置在 public/llms.txt。

llms.txt 是面向AI搜索引擎的结构化信息文件，让 ChatGPT、Perplexity、Claude 等能快速了解公司和产品。

内容结构：
# [公司英文名]
> [一句话定位，如 Professional [产品] Manufacturer in China]

## About
[2-3句公司介绍：成立年份、主营产品、工厂规模、出口能力]

## Products
- [分类1]: [该分类下的产品型号列表]
- [分类2]: [该分类下的产品型号列表]
...

## Certifications
[认证列表，如 CE (EN352-2), ISO 9001:2015, ANSI S3.19]

## Key Advantages
- [优势1]
- [优势2]
- [优势3]

## Contact
- Website: [网址]
- Email: [邮箱]
- Phone: [电话]
- WhatsApp: [号码]
- Address: [工厂地址]

数据来源：
- 从 site.config.ts 读取公司信息和联系方式
- 从 products.ts 读取产品分类和型号列表
- 从 CLAUDE.md 读取认证和公司介绍

要求：
- 内容必须与网站实际数据一致，不能编造
- 纯文本格式，不要HTML标签
- 简洁客观，百科式描述，不要营销腔
- 构建验证确认文件存在于 dist/llms.txt
```

### 阶段6：SEO与GEO完善

```
请完成网站的SEO和GEO（AI搜索优化）配置。

执行清单：

SEO部分：
1. 每页独立 title（50-60字符）和 meta description（120-160字符）
2. Schema.org 结构化数据：
   - Organization（首页）
   - Product（每个产品详情页）
   - FAQPage（首页FAQ）
   - Article（每篇博客）
   - BreadcrumbList（产品详情页）
3. sitemap-index.xml 自动生成（排除 /admin）
4. robots.txt：Allow: / + Sitemap URL + AI爬虫白名单
5. llms.txt：公司介绍 + 产品结构 + 联系方式
6. canonical URL + Open Graph 标签
7. hreflang 标签（5语言 + x-default）
8. 图片 alt 文字格式：产品名 + 关键词 + China manufacturer

GEO部分：
1. 首页FAQ模块（6个问答）+ FAQPage Schema
2. 产品描述前40-60词包含直接答案
3. 产品规格表格化（AI容易抓取）
4. robots.txt AI爬虫白名单（7个）：
   - GPTBot, ChatGPT-User, Google-Extended, PerplexityBot, 
   - ClaudeBot, Amazonbot, Meta-ExternalAgent
5. 博客文章含统计数据和对比表格

验证：
- npm run build 零错误
- 检查 sitemap 包含所有页面
- 检查 robots.txt 格式正确
```

### 阶段6.1：转化功能与体验增强

```
请为网站添加以下转化功能和用户体验增强组件，这些是B2B独立站的标配功能。

执行清单：

1. GA4 埋点（占位符模式）：
   - 在 <head> 中嵌入 GA4 代码片段，跟踪ID用占位符 G-XXXXXXXXXX
   - 表单提交成功触发 generate_lead 事件
   - 产品详情页浏览触发 view_item 事件
   - 注释标注：上线前替换为客户真实GA4 ID

2. WhatsApp 悬浮按钮：
   - 右下角固定定位，绿色圆形图标
   - 点击跳转到 WhatsApp 对话（号码从 site.config.ts 读取）
   - 预填消息："Hi, I'm interested in your products. Please send me more details."
   - 移动端和桌面端都显示，移动端尺寸稍大（方便点击）
   - 带呼吸灯动效（轻微缩放），吸引注意但不干扰

3. Thank You 感谢页：
   - 路径：/[lang]/thank-you/
   - 内容：成功图标 + 多语言感谢文案 + 预期回复时间（24h）
   - 功能：GA4 转化事件触发（generate_lead）
   - 按钮：返回首页 / 继续浏览产品 / WhatsApp联系
   - 推荐4个热销产品（留住用户继续浏览）
   - 所有语言版本都要有

4. 退出意图弹窗（Exit Intent Popup）：
   - 桌面端：鼠标移出视口顶部时触发
   - 移动端：不启用（移动端体验差）
   - 弹窗内容：
     - 标题："Before You Go — Get a Free Quote!"
     - 副标题："Tell us what you need, we'll reply within 24 hours."
     - 简化表单：邮箱 + 产品兴趣（下拉选择）+ 提交按钮
     - 关闭按钮（右上角X）
   - 限制：每个用户每次访问只弹一次（localStorage标记）
   - 多语言支持

5. 产品对比功能：
   - 产品列表页每个产品卡片添加"+ Compare"按钮
   - 底部固定对比栏（选中2-4个产品后显示）
   - 点击"Compare Now"弹出对比表格：
     - 纵向列出产品，横向列出参数（规格、认证、材质等）
     - 差异项高亮显示
     - 每个产品带"Send Inquiry"按钮
   - 数据从 products.ts 读取，无需额外维护

6. 视频占位区块：
   - 首页 Why Choose Us 模块下方，或 About 页面
   - 显示为视频缩略图 + 播放按钮图标
   - 默认占位状态：显示工厂外景图（或产品图）+ "Factory Tour Video Coming Soon"
   - 客户提供视频后，替换为 YouTube/Vimeo 嵌入（延迟加载）
   - 注释标注：待客户提供工厂实拍视频

7. 滚动进度条：
   - 页面顶部（导航栏下方）显示一条细线进度条
   - 颜色使用主色调（--color-primary）
   - 高度 3px，随页面滚动推进
   - 仅在长页面显示（博客文章、产品详情页）
   - 首页和短页面不显示

验证：
- npm run build 零错误
- 每个功能逐一测试
- 移动端适配检查（WhatsApp按钮不遮挡内容）
- 感谢页所有语言版本存在
```

### 阶段7：最终构建与打包

```
请完成网站最终构建和打包。

执行步骤：
1. npm run build — 确认零错误
2. 检查 dist/ 目录：
   - 页面数量（应为 语言数 × 页面数 + 根路由）
   - 静态资源完整（CSS、图片）
   - 总体积合理（< 5MB）
3. 逐项检查：
   - [ ] 所有产品详情页存在
   - [ ] 5语言页面数量对等
   - [ ] 根路由 / 跳转到 /en/
   - [ ] favicon 存在且颜色正确
   - [ ] sitemap-index.xml 存在
   - [ ] robots.txt 存在
   - [ ] .htaccess 存在（HTTPS强制 + www重定向）
4. 报告最终数据：
   - 页面总数、语言数、产品数、图片数
   - 打包体积、CSS/JS体积
   - 构建错误数、404链接数

注意：dist/ 目录即为上传到 Hostinger 的内容，不含 node_modules。
```

---

## 四、注意事项

1. **每个阶段都要构建验证** — `npm run build` 零错误才进入下一阶段
2. **产品数据不能编造** — 缺失的规格参数留空或写 "Contact for details"
3. **图片先用外部URL** — 客户补图后再替换为本地WebP
4. **多语言要地道** — 不是简单机翻，要用目标语言的B2B行业用语
5. **FAQ内容要行业相关** — 不要通用问答，要客户实际会被问到的问题
6. **博客正文保持英文** — B2B行业标准，只翻译标题和摘要
7. **Schema数据要准确** — 产品型号、认证标准等必须与产品数据一致
8. **域名未定时用占位符** — 全部用 `https://example.com`，上线前统一替换
9. **GA4和Web3Forms用占位符** — 上线前统一替换为真实ID，代码中注释标注
10. **退出意图弹窗只限桌面端** — 移动端不启用，避免影响用户体验
11. **视频区块先用占位图** — 不要用空白或broken链接，等客户提供实拍视频再替换

---

*独立站建站智能体 · 独立站技能库 · 建站执行技能*
