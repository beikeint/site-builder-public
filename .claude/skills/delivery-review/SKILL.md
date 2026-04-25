---
name: delivery-review
description: Website delivery workflow - competitor analysis, five-dimension scoring, blog quality review, launch checklist, Search Console submission
---
# 交付验收技能 — 竞品分析 + 验收评分 + 交付文档 + 上线检查

> 适用场景：网站开发完成后，从竞品对标、质量验收、文档编写到最终上线的完整交付流程。
> 使用者：独立站建站智能体（内部）
> 更新时间：2026-03-31

---

## 一、使用场景

- 网站开发完成，准备进入交付阶段
- 需要对网站做上线前的全面检查
- 需要生成客户交付文档（交付说明书、使用指南）
- 需要与竞品网站做对标分析，量化自身水平

---

## 二、交付流程（4步）

```
第1步：竞品分析 → 知道我们在什么水平
第2步：阶段验收 → 五维度打分，找出短板
第3步：上线检查 → 逐项核查，确保零遗漏
第4步：交付文档 → 给客户一份完整的使用说明
```

---

## 三、核心提示词

### 提示词1：竞品分析报告

```
请对以下网站进行竞品对标分析：

我们的网站：【URL或项目路径】
参考站（同行）：【URL】
行业标杆：【URL】

分析维度（6个），每个维度用表格对比：

1. 询盘转化设计
   对比：浮动按钮、CTA数量、产品页询盘入口、信任标签

2. 产品展示
   对比：图片质量、分类方式、详情页深度、SKU数量

3. 信任背书
   对比：认证展示、数据展示、客户案例、视频内容

4. SEO & 内容
   对比：Title优化、FAQ、博客/文章、Schema、Sitemap

5. 视觉设计
   对比：整体风格、配色、动效、移动端

6. 技术
   对比：图片格式、CSS/JS体积、页面加载

每个对比点标注：✅ 有 / ❌ 无，以及 "我们优于/持平/弱于" 的判断。

输出：
- 逐维度对比表格
- 我们的核心优势（Top 5）
- 我们的主要差距（按优先级排序，含改进建议）
- 结论：一段话总结
```

### 提示词2：五维度阶段验收报告

```
请对当前网站进行五维度阶段验收，输出正式的验收报告。

验收标准：跨境B2B询盘独立站行业标准

验收维度及评分规则：

一、技术（满分10分）
得分项（每项+1分）：
- 静态站性能（CSS+JS < 50KB）
- 构建零错误
- Sitemap自动生成
- robots.txt配置
- 移动端适配
- .htaccess（HTTPS+重定向）
- Canonical URL
- 每页唯一H1
- WebP图片
- hreflang标签

二、SEO（满分10分）
得分项：
- 每页独立title+description（+2）
- Product Schema（+1.5）
- FAQ Schema（+1.5）
- 图片alt文字（+1）
- URL结构简洁（+1）
- OG标签完整（+1）
- 内链结构（+0.5）
- hreflang（+0.5）
- 博客/文章（+0.5）
- llms.txt（+0.5）

三、转化（满分10分）
得分项：
- 浮动询盘按钮（+2）
- Hero CTA（+1）
- 导航栏CTA（+1）
- 产品页双入口（+1）
- 信任标签（+1）
- 表单预填（+0.5）
- Hero信任行（+0.5）
- CTA Banner（+0.5）
- 感谢页+GA4（+0.5）
- WhatsApp（+0.5）
- 客户案例（+0.5）

四、视觉（满分10分）
得分项：
- 整体风格一致（+2）
- Hero设计（+1.5）
- 认证信任条（+1）
- 卡片交互（+1）
- 移动端视觉（+1）
- 页面一致性（+0.5）
扣分项：
- 产品图质量差（-1）
- 缺工厂照片（-0.5）
- 缺证书展示（-0.5）
- 无视频（-0.5）

五、内容（满分10分）
得分项：
- 产品数据完整（+1.5）
- 公司介绍（+1）
- FAQ内容（+1）
- Quality页面（+1）
- Privacy Policy（+0.5）
- 联系信息（+0.5）
- 博客文章（+1）
- 多语言翻译完整（+1.5）
- 客户案例（+0.5）
- 产品描述丰富（+0.5）

六、博客文章质量验收（每篇文章单独评分，低于7分必须修改后才能交付）

每篇博客文章按以下4个维度打分，每个维度满分10分，取平均分为文章总分。

6.1 SEO维度（满分10分）
- 目标关键词在标题中出现（+1.5）
- 目标关键词在首段出现（+1）
- 目标关键词在至少1个H2中出现（+1）
- 文章长度1500词以上（+1.5）
- 有2-3个产品页内链（+1.5）
- 所有内链有效无404（+1）
- 图片有alt文字且含关键词（+1）
- Article Schema结构化数据完整（+1）

6.2 GEO维度（满分10分）
- 开头有清晰的问题定义（+2.5）
- 有FAQ部分且至少5个问题（+2.5）
- FAQPage Schema已配置（+2）
- 有具体数据支撑观点（每150-200词一个数据点）（+3）

6.3 准确性维度（满分10分）
- 公司认证信息与网站一致，不多写（+2.5）
- 产品参数与网站产品页一致（+2.5）
- 数字和数据有来源或限定词（+2.5）
- 竞品信息用保守表述（+2.5）

6.4 可读性维度（满分10分）
- 段落结构清晰，有H2/H3层级（+2）
- 有对比表格辅助理解（+2）
- 有列表/要点归纳（+2）
- 语言专业但易懂，适合B2B采购商阅读（+2）
- 结尾有CTA引导询盘（+2）

评分判定规则：
- 文章总分 ≥ 7分 → 通过验收，可交付
- 文章总分 < 7分 → 必须修改后重新评分，不得交付
- 任何单一维度 < 5分 → 该维度为严重不合格，必须优先修改

输出格式：
- 总评分（5维度平均）
- 每个维度：得分 + 评级 + 得分项表格 + 扣分项表格
- 待改进清单：必须修复（低于8分的维度） + 建议改进
- 结论（一段话）
```

### 提示词2.5：交付前补强执行（上线检查之前必须完成）

```
请在上线检查之前，执行以下7项补强任务，确保网站达到行业顶级水准。

一、补全行业标准缺口（5项检查）

逐项检查并补全：
1. 认证展示完整性 — 所有认证（CE/ISO/FDA/BSCI等）在认证页面有独立条目（图标+名称+编号+适用标准），产品详情页对应产品显示相关认证标签
2. 产品规格完整性 — 每个产品至少8个规格参数（材质/尺寸/重量/颜色/标准/包装/MOQ/认证），缺失的标注"Contact for details"
3. 信任数据具体化 — Why Us的4个数据不能用模糊词（"many"/"large"），必须用具体数字（"15+ Years"/"200M+ Units/Year"/"80+ Countries"/"500+ Clients"）
4. 询盘入口数量 — 确保至少5个入口：导航栏CTA、Hero区CTA、产品页Send Inquiry、浮动按钮、CTA Banner。如果少于5个，补齐
5. Privacy Policy — 必须有隐私政策页面，多语言版本，包含GDPR合规条款

二、B2B最佳实践强化清单

逐项执行：
- [ ] Hero信任行存在且包含4项（Free Samples / Low MOQ / 24h Reply / OEM Available）
- [ ] 认证信任条在Hero下方（5-6个认证图标一行排列）
- [ ] 产品卡片有Bestseller/New角标
- [ ] 下单流程4步图示完整（Inquiry → Sample → Order → Delivery）
- [ ] CTA Banner在页面中段（渐变背景 + 行动号召 + 按钮）
- [ ] 产品详情页有相关产品推荐（同分类4个产品）
- [ ] 产品详情页有面包屑导航
- [ ] About页面有公司里程碑/发展历程
- [ ] Contact页面有地图嵌入或地址图示
- [ ] 页脚包含公司全称+地址+"Verified Supplier since [年份]"

三、移动端专项优化

用移动端视角检查并修复：
1. 导航菜单：**hamburger 按钮必须存在**（id="mobileMenuToggle"），展开后主导航/语言切换/CTA 全部可点；点击时图标在 ☰ / ✕ 之间切换，aria-expanded 更新。**header 用 `<img src="/logo.png">` 图片 logo，禁用纯 `<span>BRAND</span>` 文字**（2026-04-23 demo-a 事件教训）
2. Hero区：标题不超过2行，CTA按钮足够大（最小48x48px触控区域）
3. 产品卡片：单列排列，图片清晰，信息不截断
4. 表单：输入框宽度100%，键盘弹出后表单不被遮挡
5. WhatsApp按钮：不遮挡页面内容，不与浮动询盘按钮重叠
6. 表格：产品规格表格水平可滚动，不撑破布局
7. 字体：最小14px，行高1.6，阅读舒适
8. 退出意图弹窗：移动端已禁用

四、极限速度优化

执行以下性能优化：
1. 图片全部WebP格式，质量80%，宽度不超过1200px
2. CSS总体积 < 50KB（移除未使用的Tailwind类）
3. JS总体积尽量为0（Astro静态站优势），必要JS延迟加载
4. 首屏图片预加载（Hero背景图/产品图），非首屏图片lazy loading
5. 字体：系统字体优先，如有自定义字体用font-display: swap
6. 总打包体积 < 3MB（不含图片外链情况下）
7. 检查是否有未压缩的大文件

五、结构化数据增强

检查并补全以下5种Schema：
1. Organization（首页）：name, url, logo, contactPoint, address, sameAs, foundingDate
2. Product（每个产品详情页）：name, description, image, brand, manufacturer, offers, sku, aggregateRating（如有）
3. FAQPage（首页FAQ区域）：mainEntity包含所有Q&A
4. Article（每篇博客）：headline, author, datePublished, dateModified, image, publisher
5. BreadcrumbList（产品详情页）：itemListElement完整面包屑链
- 用JSON-LD格式嵌入<head>
- 验证：用Google Rich Results Test工具格式检查（或人工审查JSON结构）

六、内链优化

构建完整的内链网络：
1. 首页 → 每个产品分类页（通过分类卡片）
2. 分类页 → 每个产品详情页
3. 产品详情页 → 同分类相关产品（4个推荐）
4. 产品详情页 → 返回分类页（面包屑）
5. 博客文章 → 相关产品详情页（文章内自然链接）
6. 博客文章 → 相关博客文章（底部推荐阅读）
7. 所有页面 → 联系页面（通过导航和CTA）
8. 检查：不存在孤立页面（每个页面至少被2个其他页面链接）

七、最终重新打包

完成以上所有补强后：
1. npm run build — 必须零错误零警告
2. 检查dist/目录完整性
3. 对比补强前后：页面数是否增加、体积变化、新增Schema数量
4. 输出补强报告：完成了哪些项、跳过了哪些项（及原因）
```

### 提示词3：上线前检查报告

```
请对网站进行上线前逐项检查，生成正式的检查报告。

检查清单：

一、构建完整性（4项）
1. 构建无错误（npm run build 输出）
2. 五语言页面对等（每种语言页面数一致）
3. 根路由跳转（/ → /en/，使用meta refresh，不显示"Redirecting"）
4. 总体积合理（< 5MB）

二、核心页面（3项）
5. 核心页面×语言数 全部存在（首页/产品/关于/联系/隐私等）
6. 产品详情页×语言数 全部存在
7. 内链404检查（所有页面内链指向有效页面）

三、静态资源（4项）
8. CSS/JS体积合理（CSS < 50KB，JS尽量为0）
9. 图片格式（WebP优先）
10. 图片引用完整（所有产品图有对应文件）
11. favicon存在且颜色匹配主色调

四、SEO（8项）
12. 每页独立title且有效
13. 每页独立meta description
14. hreflang标签（语言数+1个x-default）
15. Schema.org（Product + FAQPage）
16. Canonical URL
17. OG标签完整
18. sitemap.xml自动生成（收录所有页面）
19. robots.txt（Allow + Sitemap + AI白名单）

五、功能（3项）
20. 阿拉伯语RTL布局（dir="rtl"）
21. .htaccess（HTTPS强制 + www重定向）
22. 多语言翻译完整

五·半、移动端导航与 Logo（3项 · 2026-04-23 新增 · 防 demo-a "手机端没有导航栏/logo 没更新" 事件重演）
22.1 移动端 hamburger + menu panel 存在
   验证命令：
   ```
   curl -A "Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 Mobile/15E148 Safari/604.1" \
     https://{域名}/en/ | grep -cE 'id="mobileMenuToggle"|id="mobile-menu-btn"'
   ```
   必须 >= 1（为 0 表示手机用户根本看不到主导航）
22.2 Header 使用 <img> logo 而非纯文字
   验证命令：`grep -cE '<img[^>]*logo\.(png|svg|webp)' dist/en/index.html`
   必须 >= 1（纯文字 logo 客户会反馈"logo 没更新"）
22.3 真机或 Chrome DevTools mobile 模式肉眼验证
   - hamburger 点击能展开 / 收起
   - menu panel 包含所有主导航 + 语言切换
   - icon 会在 hamburger (☰) 和 close (✕) 之间切换
   - aria-expanded 状态随切换更新

注：上述 3 项已内置于 `scripts/build-qa.sh` 第 9 项，`npm run qa` 会自动跑。基于 astro-b2b-starter v2.4+ 的新站默认带正确的 Header 实现，但老站 fork 时可能继承早期文字 logo 版本，交付前必须对着本清单 22.1/22.2 验证一次。

五·四、v2.5 前沿视觉默认配置（3项 · 2026-04-25 新增 · 防"3 圆按钮模板化丑"+"白底单调"事件重演）

> **背景**：2026-04-25 客户两次反馈 ① demo-a v1 FloatingCTA 三圆按钮"丑+所有站都这样" ② 全站白底太单调。已通过 starter v2.5 升级（FloatingCTA Intercom-style + Header backdrop-blur + ScrollProgress + Cards hover lift + SectionBackdrop bold mode）从源头修。本组验收防止老站或 fork 错版本时漏检。

#16 全站浮动入口只剩 1 处（FloatingCTA 容器）
   - 验证命令：`grep -cE 'fixed bottom-6 right-6|bottom-6 right-6 rtl' dist/en/index.html`
   - 必须 == 1（>1 = 有旧 FloatingCTA v1 残留 / Footer 老 fixed WhatsApp 按钮没删，会重叠）
   - 失败时定位：`grep -rn "fixed bottom-6 right-6" src/components/ src/layouts/ src/pages/`

#17 FloatingCTA v2 Intercom-style trigger 存在
   - 验证命令：`grep -cE 'id="floating-cta-trigger"|aria-controls="floating-cta-popup"' dist/en/index.html`
   - 必须 >= 1（== 0 = 还在用 v1 三圆按钮，客户会反馈"丑+所有站都这样"）
   - 失败时操作：从 `astro-b2b-starter/src/components/core/FloatingCTA.astro` 复制 v2 版本替换；同步注入 i18n `floatingCta.*` 9 个 key 每语种

#18 Header backdrop-blur + 顶部 ScrollProgress 进度条
   - 验证命令：
     ```
     grep -cE 'id="site-header"[^>]*backdrop-blur' dist/en/index.html  # 必须 >= 1
     grep -cE 'id="scroll-progress"' dist/en/index.html                 # 必须 >= 1
     ```
   - 失败时定位：检查 BaseLayout.astro 是否 import + 渲染 ScrollProgress；检查 Header.astro 是否带 `id="site-header"` + `bg-white/95 backdrop-blur-md`
   - 真机验证：滚动页面时观察顶部 3px 渐变条跟随滚动比例移动；Header 滚动后 shadow 加深

注：以上 3 项已内置于 `scripts/build-qa.sh` 第 10 项（v2.5 Frontier Visual Defaults），`npm run qa` 自动跑。基于 astro-b2b-starter v2.5+ 的新站默认全过；老站升级时按上述命令逐项验证。

六、收录加速优化（必须，上线当天执行）
操作人：服务商（Claude Code执行）
23. 检查sitemap.xml是否包含所有页面
24. 检查robots.txt是否正确允许爬取
25. 检查所有页面canonical标签是否正确
26. 生成收录检查报告.md

七、Google Search Console提交（必须，上线后48小时内完成）
操作人：服务商（需客户提供Google账号或授权）
27. 登录 search.google.com/search-console
28. 添加资源 → 选择"网址前缀" → 输入网站地址（如 https://域名）
29. 验证所有权（推荐HTML文件上传方式）
30. 提交sitemap：域名/sitemap-index.xml
31. 检查索引覆盖情况
完成后效果：Google开始主动爬取网站 / 可查看关键词排名数据 / 可发现索引问题

八、待处理（标注）
32. Web3Forms Access Key 是否已配置
33. GA4 跟踪ID是否已替换
34. 域名是否已解析

输出格式：
- 检查总结：X项通过 / X项待处理 / X项失败
- 逐项检查结果表格（#/检查项/结果/详情）
- 上线操作清单（按步骤）
- 最终交付数据（页面数/语言数/产品数/图片数/体积等）
```

### 提示词4：网站交付说明书

```
请为客户生成网站交付说明书，这是客户唯一需要阅读的文档，必须简洁、非技术化。

客户信息：
- 公司：【客户公司名】
- 域名：【域名】
- 交付日期：【日期】

请按以下结构生成：

一、网站概述
- 技术架构（一句话）
- 页面总数
- 支持语言
- 产品数量
- 询盘方式
- 部署方式

二、网站结构（树状图）
- 列出所有页面及其层级关系

三、询盘系统说明
- 询盘流程（客户填表 → 处理 → 邮箱通知）
- 接收邮箱
- 询盘包含的字段
- 回复建议（24小时内、用客户语言、附规格书）

四、日常维护指南
- 什么操作需要联系服务商（表格）
- 什么操作客户可自行完成（表格）
- 提交修改请求的格式模板

五、域名与主机信息
- 域名、注册商、续费周期
- 主机商、类型、目录
- 重要提醒（按时续费）

六、SEO基础配置
- 已内置的SEO功能清单（表格：功能/状态）
- 后续SEO建议（4条）

七、网站文件清单
- 交付的文件目录结构

八、修改范围与收费说明
- 本次包含的免费修改（3次，定义每次修改范围）
- 不占用免费次数的情况（服务商Bug、技术问题）
- 超出范围收费标准：
  - 基础修改：¥200/次
  - 产品增减：¥100/个
  - 新页面：¥500-1500/页
  - 功能开发：按项目报价
  - 年度维护包：¥2000/年（含12次基础修改）
- 紧急修改响应时间

九、建站过程客户确认节点
- 6个确认节点表格（需求确认→结构规划→素材交接→首页视觉→全站预览→上线确认）
- 当前项目状态标注

十、后续服务
- 维护服务内容
- 联系方式

十一、客户确认事项
- 上线前必须确认的检查清单（Web3Forms Key、GA4 ID、域名解析、SSL等）

语言要求：中文，简洁，非技术化，老板能看懂。
```

### 提示词5：上线后第一周检查清单

```
请生成网站上线后第一周的检查清单，确保网站正常运行并开始产生效果。

域名：【域名】

第一周检查清单：

Day 1：基础功能验证
- [ ] 访问首页正常（HTTPS）
- [ ] 5种语言切换正常
- [ ] 阿拉伯语RTL布局正确
- [ ] 所有产品页可访问
- [ ] 提交测试询盘 → 邮箱收到通知
- [ ] WhatsApp跳转正常
- [ ] 移动端访问正常

Day 2-3：SEO提交
- [ ] Google Search Console 验证域名
- [ ] 提交 sitemap-index.xml
- [ ] 检查 robots.txt 可访问
- [ ] Bing Webmaster Tools 注册（可选）
- [ ] Google Business Profile 注册（可选）

Day 4-5：监控设置
- [ ] Google Analytics 4 数据开始流入
- [ ] 设置 GA4 转化事件（表单提交）
- [ ] 检查感谢页 GA4 事件触发

Day 6-7：复查
- [ ] Google Search Console 查看已索引页面数
- [ ] 搜索 "site:域名" 查看收录情况
- [ ] 检查是否有404错误（Search Console）
- [ ] 向客户确认询盘邮件接收正常

输出为Markdown格式，可直接发给执行人员。
```

### 提示词6：客户月度健康报告

```
请根据以下数据生成客户月度健康报告：

客户：【客户名称】
报告周期：【年月】
域名：【域名】

本月数据：
- 访问量：【数字】（上月【数字】）
- 询盘数：【数字】（上月【数字】）
- 平均停留时间：【秒数】
- 跳出率：【百分比】
- 关键词排名变化：
  - 【关键词1】：第X → 第X
  - 【关键词2】：第X → 第X
  - ...
- 本月完成事项：
  - 【事项1】
  - 【事项2】
- 下月计划：
  - 【计划1】
  - 【计划2】

报告要求：
- 先写一句话总结概况
- 核心数据表格（访问量、询盘数、环比变化）
- 关键词排名Top 5表格
- 本月完成事项（列表）
- 下月计划（列表）
- 建议与备注（1-2条）
- 语气专业简洁，老板5分钟能看完
- 底部署名：独立站建站智能体

输出纯文本格式，可直接转为PDF。
```

---

## 四、交付文件清单模板

每个客户交付时应包含以下文件：

```
${WORKSPACE_ROOT}/客户/独立站-客户XXX/
├── CLAUDE.md               ← 项目配置（内部用）
├── 素材整理.md              ← 素材整理记录
├── 竞品分析报告.md           ← 竞品对标分析
├── 阶段验收报告.md           ← 五维度评分
├── 上线检查报告.md           ← 逐项检查结果
├── 网站交付说明书.md         ← 给客户的使用说明（核心交付物）
├── 上线后第一周检查清单.md    ← 上线后操作指南
└── website/                ← 网站源码
    ├── src/                ← 源代码
    ├── public/             ← 静态资源
    ├── dist/               ← 构建输出（上传到主机）
    ├── package.json
    └── astro.config.mjs
```

---

## 五、Hostinger 部署步骤

```
1. 构建并部署：
   方式A（MCP一键部署）：deployer.deploy(client_id)
   方式B（手动）：npm run build && scp -r dist/* user@host:/web_root/

2. 登录 Hostinger → 网站 → 导入网站（首次部署时）
   - 框架：Astro
   - Node版本：20.x
   - 根目录：./
   - 构建设置：Astro默认

3. 等待部署完成（通常1-3分钟）

4. 绑定域名 → 开启SSL → 等待DNS生效

5. 验证：
   - https://域名/ → 跳转到 /en/
   - https://域名/en/products → 产品列表
   - https://域名/ar/ → RTL阿拉伯语
   - 提交测试询盘 → 邮箱收到
   - sitemap-index.xml 可访问
```

---

## 六、注意事项

1. **竞品分析要客观** — 既要看到自己的优势，也要正视差距，给客户看的版本可以调整措辞
2. **验收评分要诚实** — 内部评分不注水，低于8分的维度必须列出改进计划
3. **交付说明书是核心** — 这是客户唯一会看的文档，必须简洁、非技术化、中文
4. **上线前必须测试询盘** — Web3Forms Key 未配置 = 表单不工作 = 客户收不到询盘
5. **域名和主机续费提醒** — 在交付说明书中明确提醒，避免客户忘记续费导致网站下线
6. **保留项目完整文件** — 不要只交付 dist，源码、配置、文档全部保留在项目文件夹
7. **上线后第一周跟进** — 不是交付就结束，第一周要主动检查和跟进
8. **Search Console和GA4必须人工操作** — 智能体负责提醒和指导，但不能替代人工登录Google账号完成验证、提交sitemap等操作

---

*独立站建站智能体 · 独立站技能库 · 交付验收技能*
