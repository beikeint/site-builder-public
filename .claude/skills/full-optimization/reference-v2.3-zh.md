---
name: 全面优化
description: 网站初版完成后进行五维度（技术/SEO/转化/视觉/内容）系统性质量审计和优化
---

# 全面优化技能 v2.4 — 五维度 + 业务叙事一致性 + MVP 对照

> 适用场景：网站初版建设完成后，进行系统性的质量优化。覆盖技术、SEO、转化、视觉、内容五个维度。
> 使用者：独立站建站智能体（内部）
> 更新时间：2026-04（v2.3）→ **v2.4 升级**

---

## 🚨 v2.4 升级补丁

### 新增：第六维度 · 业务叙事一致性审计

v2.3 的五维度（技术 / SEO / 转化 / 视觉 / 内容）都是**执行质量维度**，但审不出 Demo-A v2 那种"每条都合格但整体错位"的情况。v2.4 增加第六维度：

**业务叙事一致性审计**：

1. **档案 vs 实现对照**：打开《业务叙事档案.md》第 4 节页面地图 → 对照 `site.config.ts` 的 layout.home → 是否完全一致？
2. **叙事单元落地检查**：档案第 2 节的每个叙事单元，是否都有对应 section/独立页承载？
3. **功能开关一致性**：档案第 5 节的开关决策 vs `site.config.ts` 的 features 实际值 → 是否一致？
4. **产品页布局正确性**：档案第 4 节的 productDetail 选择 vs 实际布局 → 是否匹配？

### 新增：MVP 对照测试（反模板复刻防线）

**源起**：Demo-A v1 MVP（115 页手搓）客户满意 vs v2 满配（4441 页）客户不满。发现**升级版讲不清业务就是负优化**。

**测试方法**：

1. 脑海构想一个 6-section 手搓 MVP 版（Hero / TrustBar / {叙事1} / {叙事2} / Products / CTA）
2. 当前站和 MVP 版对比：**当前站讲业务是否比 MVP 更清晰**？
3. 不更清晰 → **负优化，直接回炉到 build-execution 砍 section**
4. 更清晰 → 继续下面的五维度审计

### 反模板复刻自检 5 问（本技能交付前必过）

- [ ] 1. 去掉公司名和 logo，同行业其他客户能直接套用这个网站吗？**必须"不能"**
- [ ] 2. 客户看完首页能用一句话说出"你和同行有什么不同"吗？**必须"能"**
- [ ] 3. 砍掉一半 section，网站故事还成立吗？**不成立 = 砍**
- [ ] 4. `data/*.ts` 占位数据占比 < 30%？
- [ ] 5. 产出比手搓 MVP 版本讲得更清楚吗？**不清楚 = 负优化回炉**

### 视觉填充审计升级（v2.4 新增）

在"视觉维度"里新增硬检查：

- [ ] 所有 icon 字段无 emoji（lucide / tabler / heroicons SVG）
- [ ] advantages / solutions / factory 图片均为真实照（无简笔线框 jpg）
- [ ] 方形产品图未配 full-width productDetail 布局（防 Demo-A 通图事件）
- [ ] 首页 section 间距与内容密度匹配（内容稀薄必用 py-12 而非 py-20）

### 硬规则（v2.4）

- ❌ **禁止绕过业务叙事一致性审计**（五维度全通过但叙事错位仍视为不合格）
- ❌ **禁止跳过 MVP 对照测试**（负优化是建站智能体最大失败）
- ❌ **禁止放行反模板复刻第 1 问答"能"的交付物**

---

## 一、使用场景

- 网站初版构建完成，需要全面提升质量
- 客户要求优化现有网站的某个维度
- 定期维护时的季度性全站审查
- 竞品分析后发现差距，需要针对性补强

---

## 二、五维度优化框架

| 维度 | 目标分 | 核心指标（v2.3更新） |
|------|--------|---------|
| 技术 | 9.0+ | 构建零错误、CSS+JS<50KB、WebP、hreflang、`npm run qa` 15项全过 |
| SEO | 9.0+ | 独立title/desc、**5种Schema（含FAQPage）**、GEO答案胶囊、sitemap、robots.txt、llms.txt |
| 转化 | 9.0+ | **5触点/产品页**、产品页内嵌询盘、浮动CTA、退出弹窗、分步表单、**GA4 12事件全连线** |
| 视觉 | 8.0+ | 统一配色、高清图片、hover交互、移动端适配 |
| 内容 | 8.0+ | 多语言完整翻译、3+篇博客、FAQ、产品描述丰富 |

---

## 三、核心提示词

### 提示词1：全站五维度审计

```
请对当前网站进行五维度全面审计，每个维度逐项打分（满分10分），给出具体的得分项和扣分项。

审计维度：

一、技术维度（满分10分）
检查项：
- 构建是否零错误
- CSS + JS 总体积
- 图片格式（是否WebP）
- sitemap 自动生成
- robots.txt 配置
- 移动端响应式
- .htaccess（HTTPS + www重定向）
- Canonical URL
- 每页唯一H1
- hreflang 标签（多语言站必须）

二、SEO维度（满分10分）
检查项：
- 每页独立 title（50-60字符）+ description（120-160字符）
- Schema.org（Organization / Product / FAQPage / Article / BreadcrumbList）
- 图片 alt 文字
- URL 结构是否简洁可读
- OG 标签完整性
- 内链结构
- hreflang 多语言标记
- 博客/文章是否存在
- llms.txt 文件

三、转化维度（满分10分）
检查项：
- 浮动询盘按钮（全页面可见）
- Hero 区 CTA 按钮
- 导航栏 CTA
- 产品页询盘入口（表单 + 邮件）
- 产品页信任标签（Free Samples / 24h / OEM）
- 表单预填功能
- 感谢页（含GA4转化追踪 + 推荐产品）
- WhatsApp 浮动按钮
- 客户案例/评价

四、视觉维度（满分10分）
检查项：
- 整体风格一致性
- 配色合理性（主色 + CTA对比色）
- Hero 区设计
- 卡片交互（hover效果）
- 移动端视觉表现
- 产品图片质量（≥800px宽）
- 工厂/团队照片
- 证书展示
- 视频内容

五、内容维度（满分10分）
检查项：
- 产品数据完整性（规格参数表格）
- 公司介绍深度
- FAQ 内容质量
- 博客文章数量和质量
- 多语言翻译完整度
- 客户案例/合作品牌
- Privacy Policy
- 联系信息完整度

输出格式：
- 每个维度：得分 + 评级 + 得分项表格 + 扣分项表格
- 底部：待改进清单（按优先级排序：必须修复 / 建议改进）
- 总评分（5个维度平均分）
```

### 提示词2：技术优化执行

```
请执行以下技术优化任务：

1. 图片转WebP：
   - 将所有 JPG/PNG 图片转换为 WebP 格式
   - 保持原始分辨率，质量设为 80%
   - 更新所有图片引用路径

2. hreflang 标签补全：
   - 每个页面添加5语言 + x-default 的 hreflang link 标签
   - 格式：<link rel="alternate" hreflang="en" href="https://域名/en/当前路径/" />
   - x-default 指向英文版

3. 性能优化：
   - CSS 压缩（确保 < 50KB）
   - 移除未使用的 CSS 类
   - 图片 lazy loading（首屏以外的图片）
   - 预加载关键资源

4. 安全配置：
   - .htaccess HTTPS 强制跳转
   - www → 非www 重定向
   - 安全响应头（X-Content-Type-Options, X-Frame-Options）

5. 构建验证：
   - npm run build 零错误
   - 输出页面数量和总体积
```

### 提示词3：SEO深度优化

```
请对网站进行SEO深度优化：

1. Title 和 Description 优化：
   - 检查每页 title 是否包含目标关键词
   - 格式：产品名/页面名 | 核心关键词 - 品牌名
   - Description 包含行动号召（Get Quote, Contact Us）
   - 列出所有页面的 title/description 供审核

2. Schema 结构化数据完善：
   - Organization（首页）：name, url, logo, contactPoint, address, sameAs
   - Product（产品页）：name, description, image, brand, manufacturer, offers
   - FAQPage（FAQ区域）：mainEntity 数组
   - Article（博客文章）：headline, author, datePublished, image
   - BreadcrumbList（产品详情页）：itemListElement

3. 内链优化：
   - 首页 → 分类页 → 产品详情页 → 相关产品（形成网状）
   - 博客文章内链到相关产品
   - 面包屑导航

4. robots.txt 完善：
   ```
   User-agent: *
   Allow: /
   
   User-agent: GPTBot
   Allow: /
   
   User-agent: ChatGPT-User
   Allow: /
   
   User-agent: Google-Extended
   Allow: /
   
   User-agent: PerplexityBot
   Allow: /
   
   User-agent: ClaudeBot
   Allow: /
   
   User-agent: Amazonbot
   Allow: /
   
   User-agent: Meta-ExternalAgent
   Allow: /
   
   Sitemap: https://域名/sitemap-index.xml
   ```

5. llms.txt 内容：
   - 公司介绍（2-3句）
   - 产品分类和数量
   - 主要认证
   - 联系方式
   - 网站结构
```

### 提示词4：转化率优化

```
请优化网站的询盘转化设计：

1. 询盘入口检查（至少5个入口）：
   - [ ] 导航栏 "Get a Quote" 按钮（橙色/对比色）
   - [ ] Hero 区主CTA按钮
   - [ ] 产品详情页 "Send Inquiry" 按钮
   - [ ] 产品详情页 "Email Us" 直达
   - [ ] 右侧/右下角浮动按钮（带呼吸灯动效）
   - [ ] 首页底部 CTA Banner
   - [ ] WhatsApp 浮动按钮

2. 信任元素强化：
   - Hero 下方信任条：Free Samples | Low MOQ | 24h Reply | OEM Available
   - 首页认证徽章区（CE/ISO/BSCI等绿色图标）
   - 产品页信任标签
   - About 页数据展示（年份、产能、出口比例、客户数）

3. 表单优化：
   - InquiryForm 组件接受 lang prop，标签多语言显示
   - 产品页跳转自动预填产品名
   - 字段精简：姓名、邮箱、公司、国家、产品、留言
   - 提交后跳转站内感谢页 /[lang]/thank-you/

4. 感谢页设计：
   - 成功图标 + 多语言感谢文案
   - GA4 转化事件追踪（generate_lead）
   - 返回首页 / WhatsApp 按钮
   - 推荐热销产品（留住用户继续浏览）

5. 404页面优化：
   - 自定义设计（不用浏览器默认）
   - 导航按钮：首页 / 产品 / 联系
   - 热销产品推荐
```

### 提示词5：内容质量提升

```
请提升网站内容的深度和完整性：

1. 产品描述丰富化：
   - 每个产品描述扩展到3-5句，包含：
     - 第1句：直接回答"这是什么"（含关键词，适配AI搜索）
     - 第2-3句：核心卖点和差异化优势
     - 第4-5句：应用场景和适用人群
   - 规格参数表格补全（材质、尺寸、重量、颜色、标准、包装）

2. 多语言内容完整检查：
   - 以下页面内容必须翻译为5种语言（不能硬编码英文）：
     - 首页 Hero、优势栏、Why Us、FAQ、CTA
     - 关于我们页面正文
     - 质量认证页面正文
     - 联系我们页面文案
     - 感谢页文案
     - 404页面文案
   - 导航菜单、按钮文字、表单标签全部本地化

3. 博客内容补充：
   - 确保至少3篇，每篇1500-3000词
   - 每篇包含：统计数据、对比表格、实操建议、CTA
   - 博客标题和摘要翻译为5种语言
   - 正文保持英文

4. FAQ内容行业化：
   - 6个问答覆盖：MOQ、认证标准、交货期、定制服务、样品政策、质量控制
   - 回答简洁有力，包含具体数据
   - FAQPage Schema 结构化数据

5. 公司介绍重写（如需要）：
   - 突出差异化优势（而非泛泛而谈）
   - 包含具体数据（成立年份、产能、出口比例、客户数）
   - 里程碑/发展历程
   - OEM/ODM 能力说明
```

---

## 四、优化验收标准

| 维度 | 最低要求 | 优秀标准（v2.3） |
|------|---------|---------|
| 技术 | 构建零错误、WebP、hreflang | `npm run qa` 15项全过、CSS<50KB |
| SEO | 独立title/desc、Product Schema | **5种Schema**（含FAQPage）、GEO答案胶囊、llms.txt |
| 转化 | 3个询盘入口、表单可用 | **5触点/产品页**、内嵌询盘、**GA4 12事件全连线** |
| 视觉 | 统一配色、移动端适配 | 高清图片、hover动效 |
| 内容 | 产品数据完整、单语言 | 多语言完整翻译、3+篇博客、**wizardTags完整** |

---

## 五、v2.3 新增审计项

### 5.1 自动化审计（npm run qa）

全面优化阶段必须先跑 `npm run qa`，确认以下 15 项自动检查全部通过：

```
□ 构建零错误
□ 所有页面有 title + description
□ 图片全为 WebP
□ 图片 alt 100% 覆盖
□ JSON-LD Schema 存在
□ hreflang 标签存在
□ CSS < 50KB
□ JS < 50KB
□ 总体积合理
```

### 5.2 Schema 完整性审计

```
□ Organization Schema — 所有页面
□ Product Schema — 每个产品详情页
□ Article Schema — 每篇博客文章
□ BreadcrumbList Schema — 产品页 + 博客页
□ FAQPage Schema — 首页（6个Q&A）+ 产品页（4个Q&A）
```

### 5.3 GA4 事件审计

```
□ product_view — 产品详情页加载时触发
□ cta_click — 所有CTA按钮有 data-track
□ whatsapp_click — WhatsApp按钮有 data-track
□ email_click — 邮件按钮有 data-track
□ form_start — 产品页询盘表单首次聚焦
□ form_submit — 表单提交按钮有 data-track
□ catalog_download — PDF下载有 data-track
□ calculator_use — ROI计算器提交时调用 trackEvent
□ wizard_complete — 选型向导完成时调用 trackEvent
□ ai_advisor_query — AI顾问对话时调用 trackEvent
□ exit_intent_shown — 退出弹窗显示时
□ exit_intent_submit — 退出弹窗提交时
□ scroll_depth — 统一追踪系统自动触发
```

### 5.4 GEO 答案胶囊审计

```
□ 产品详情页 — 面包屑下方有答案胶囊（含产品名+型号+认证+核心参数）
□ 博客文章页 — 正文前有答案胶囊（标题+描述）
□ 程序化SEO页（如启用）— 有按类型定制的答案胶囊
□ 产品规格参数使用 <table> 格式（AI最易提取）
```

### 5.5 转化触点审计

每个产品详情页应有 5 个询盘触点：
```
□ 顶部CTA按钮（跳转页内 #inquiry）
□ WhatsApp按钮（预填产品名+型号）
□ PDF手册下载（如启用）
□ 内嵌询盘表单（页面底部，预填产品信息）
□ 浮动CTA（全局悬浮）
```

### 5.6 功能组件审计（如已启用）

```
□ ProductWizard — wizardTags 是否完整？筛选逻辑是否正确？
□ ROICalculator — roi-config.ts 参数是否合理？明细是否正确？
□ AIAdvisor — Worker URL 是否配置？对话是否正常？
□ StepForm — 3步切换是否正常？进度条是否更新？
□ CatalogDownload — 表单提交是否成功？PDF是否可下载？
□ ExitIntent — 鼠标离开是否触发？是否只显示一次？
```

### 5.7 模块化布局审计（v2.3）

```
□ site.config.ts 已配置 layout 字段
□ layout 选择基于竞品分析（有竞品布局分析.md 文件）
□ 首页通过 SectionRenderer 渲染（不是手写 HTML）
□ 产品页使用布局调度（Standard/FullWidth/Sidebar）
□ Section 变体选择有数据支撑（为什么选 hero:split 而不是 hero:gradient？）
□ 经验库已加载并应用（如有同行业经验）
```

---

## 六、注意事项

1. **先跑 `npm run qa`** — 自动化能检查的先自动化，剩下的人工审核
2. **优化有优先级** — 先修复 SEO 和转化，再修视觉和内容
3. **每次优化后构建验证** — `npm run build` 零错误才能继续
4. **量化效果** — 优化前后都跑审计，用分数对比
5. **GA4 事件必须全部可触发** — 这是运营智能体的数据基础
6. **布局选择必须有数据支撑** — 不能凭感觉选 Section 变体

---

*独立站建站智能体 · 独立站技能库 · 全面优化技能 · v2.3更新 2026-04*
