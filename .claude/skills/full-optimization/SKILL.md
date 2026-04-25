---
name: full-optimization
description: Five-dimension website audit and optimization - technical, SEO, conversion, visual, content quality improvement
---
# 全面优化技能 — 五维度网站质量提升

> 适用场景：网站初版建设完成后，进行系统性的质量优化。覆盖技术、SEO、转化、视觉、内容五个维度。
> 使用者：独立站建站智能体（内部）
> 更新时间：2026-03-31

---

## 一、使用场景

- 网站初版构建完成，需要全面提升质量
- 客户要求优化现有网站的某个维度
- 定期维护时的季度性全站审查
- 竞品分析后发现差距，需要针对性补强

---

## 二、五维度优化框架

| 维度 | 目标分 | 核心指标 |
|------|--------|---------|
| 技术 | 9.0+ | 构建零错误、CSS+JS<50KB、WebP图片、hreflang、响应式 |
| SEO | 8.5+ | 独立title/desc、5种Schema、sitemap、robots.txt、llms.txt |
| 转化 | 8.5+ | 3+询盘入口、浮动CTA、信任标签、表单预填、感谢页 |
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

| 维度 | 最低要求 | 优秀标准 |
|------|---------|---------|
| 技术 | 构建零错误、WebP图片、hreflang | CSS+JS<50KB、Lighthouse 90+ |
| SEO | 独立title/desc、Product Schema | 5种Schema全覆盖、llms.txt |
| 转化 | 3个询盘入口、表单可用 | 5+入口、感谢页+GA4追踪 |
| 视觉 | 统一配色、移动端适配 | 高清图片、hover动效、视频 |
| 内容 | 产品数据完整、单语言 | 5语言完整翻译、3+篇博客 |

---

## 五、注意事项

1. **优化有优先级** — 先修复扣分最多的维度，而非面面俱到
2. **技术优化最容易** — 纯代码层面可以直接做，不依赖客户素材
3. **内容是最大短板** — 通常需要客户配合提供案例、照片、视频
4. **每次优化后都要构建验证** — 优化过程中可能引入新错误
5. **保留优化前快照** — 优化前 git commit 或备份，便于对比和回滚
6. **量化优化效果** — 优化前后都做审计，用分数对比展示进步

---

*独立站建站智能体 · 独立站技能库 · 全面优化技能*
