---
name: build-execution
description: Phased website build execution - skeleton, products, i18n, blog, SEO, packaging with pre-publish checklist
---
# 建站执行技能 — 技术方案 + 分阶段建站

> 适用场景：项目启动完成、素材就绪后，进入实际建站开发阶段。从模板复制到全站搭建完成。
> 使用者：独立站建站智能体（内部）
> 更新时间：2026-03-31

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

以 `client-B-zhuhuadong`（多语言模板）为基础，只需修改以下文件：

```
src/data/site.config.ts     ← 品牌名、联系方式、域名
src/data/products.ts        ← 产品数据（名称、规格、图片URL）
src/data/blog.ts            ← 3篇行业博客文章
src/data/i18n/en.ts         ← 英文文案（Hero、FAQ等行业定制内容）
src/data/i18n/es.ts         ← 西班牙语
src/data/i18n/fr.ts         ← 法语
src/data/i18n/ar.ts         ← 阿拉伯语
src/data/i18n/ru.ts         ← 俄语
src/styles/global.css       ← 主色调（3行CSS变量）+ Hero渐变
public/robots.txt           ← Sitemap URL
public/llms.txt             ← 公司和产品信息
astro.config.mjs            ← site 域名
```

---

## 三、分阶段建站流程 + 提示词

### 阶段1：项目骨架搭建

```
请从多语言标准模板创建新客户网站项目，执行以下操作：

客户信息（从CLAUDE.md读取）：
- 品牌名：【英文品牌名】
- 域名：【域名】
- 行业：【行业】
- 主色调：【Hex色值】

执行步骤：
1. 复制模板项目到 website/ 目录
2. 修改 site.config.ts：
   - siteName → 客户品牌名
   - siteUrl → 客户域名
   - contactEmail/phone/whatsapp → 客户联系方式
   - address → 客户地址
   - 行业描述文案
3. 修改 global.css：
   - --color-primary → 【主色】
   - --color-primary-dark → 【深色变体】
   - --color-primary-light → 【浅色变体】
   - Hero 渐变色匹配主色调
4. 修改 astro.config.mjs：site → 客户域名
5. 修改 favicon.svg：rect fill 改为主色调
6. 运行 npm install && npm run build 验证零错误

完成后报告：页面数、构建是否成功、有无错误。
```

### 阶段2：产品数据录入

```
请根据素材整理文档，完成产品数据录入。

素材文档位置：素材整理.md

执行步骤：
1. 读取素材整理.md中的全部产品信息
2. 在 src/data/products.ts 中录入产品数据，每个产品包含：
   - id: 产品ID（slug格式，如 sa-7-1-classical-bullet-foam-ear-plugs）
   - model: 产品型号
   - name: 产品名称（英文）
   - category: 所属分类slug
   - categoryName: 分类名称
   - description: 产品描述（英文，2-3句，含关键词）
   - features: 产品特点（数组，3-5条）
   - applications: 应用场景（数组）
   - certifications: 认证标准（数组）
   - specs: 规格参数（用 " | " 分隔的 key: value 对，详情页渲染为表格）
   - image: 产品图片URL（优先本地WebP，其次外部URL）
   - isBestseller: 是否热销
   - isNew: 是否新品

3. 产品分类定义：
   - 每个分类：slug、name、icon（Astro图标名）、description
   
4. 确保 ProductCard 组件的 lang prop 正确传递

要求：
- 规格参数尽量完整（材质、尺寸、重量、SNR/NRR、颜色、包装等）
- 缺失参数标注 "Contact for details"，不要编造数据
- 图片路径统一格式
- 构建验证零错误
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

### 阶段4.5：文章发布前强制检查（每篇必须通过，未通过不能发布）

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

### 阶段4.6：生成 llms.txt

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

### 阶段5：SEO与GEO完善

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

### 阶段5.5：转化功能与体验增强

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

### 阶段6：最终构建与打包

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
