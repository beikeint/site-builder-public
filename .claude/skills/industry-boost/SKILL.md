---
name: industry-boost
description: B2B manufacturer website industry best practices - homepage structure, product pages, FAQ, trust building, GEO optimization
---
# 行业强化技能 — B2B制造商网站最佳实践

> 适用场景：针对中国制造商/工厂的B2B外贸独立站，应用行业最佳实践，让网站从"能用"变成"好用、能转化"。
> 使用者：独立站建站智能体（内部）
> 更新时间：2026-03-31

---

## 零、行业类型判断（开始前必读）

**使用本技能前，先判断客户属于哪种行业类型，两种类型的建站策略有本质区别：**

### 类型A：B2B制造商（产品驱动型）

**典型行业：** PPE/安全防护、电子元件、建材五金、化工材料、食品设备、服装纺织、日用消费品
**客户特征：** 产品SKU多（10-100+个）、按产品分类浏览、买家按型号/规格采购
**网站策略：**
- 5语言支持（英/西/法/阿/俄）+ 阿拉伯语RTL
- 以产品目录为核心，分类清晰，详情页规格参数完整
- 页面结构：首页 / 产品列表 / 产品详情 / 关于 / 质量 / 博客 / 联系
- 标准模板直接适用

### 类型B：B2B工业设备商（方案驱动型）

**典型行业：** 工业机械、自动化设备、生产线、环保设备、能源设备、检测仪器
**客户特征：** 产品SKU少但单价高（几万到几百万）、买家按"解决什么问题"或"用在什么行业"来找产品
**网站策略：**
- 3语言支持（英/西/法）— 工业设备买家以欧美为主，阿语俄语优先级低
- 以解决方案为核心，产品页面是方案的支撑
- 额外必须页面：
  - **Solutions页面** — 按场景组织（如"噪音控制方案"、"粉尘处理方案"、"自动化升级方案"），每个方案关联对应产品组合 + 应用案例
  - **Applications页面** — 按行业组织（如"Mining"、"Oil & Gas"、"Food Processing"），展示该行业适用的产品 + 成功案例
- 页面结构：首页 / Solutions / Applications / Products / 关于 / 质量 / 博客 / 联系
- 需要在标准模板基础上扩展 Solutions 和 Applications 页面

### 如何判断？

| 判断依据 | 类型A（制造商） | 类型B（设备商） |
|---------|---------------|---------------|
| 产品单价 | < ¥1000/件 | > ¥10000/套 |
| SKU数量 | 10-100+ | 3-20 |
| 买家采购方式 | 按产品型号找 | 按问题/行业找 |
| 询盘内容 | "SA-7-1报价多少" | "我们工厂噪音超标，有什么方案" |
| 决策周期 | 1-4周 | 1-6个月 |
| 语言优先级 | 5语言（全球覆盖） | 3语言（欧美重点） |

**判断完成后，在后续所有提示词中注明类型（A或B），Claude 会按对应策略执行。**

---

## 一、使用场景

- 建站基本完成，需要按B2B制造商行业标准进行强化
- 客户是工厂/制造商，目标客户是海外采购商/经销商
- 需要在SEO、转化、信任建设等方面达到行业领先水平
- 针对特定行业（PPE/机械/电子/建材等）做定制化内容

---

## 二、B2B制造商网站核心原则

1. **信任第一** — 海外采购商最关心的是"你是不是真实可靠的工厂"
2. **询盘为王** — 所有设计都服务于一个目标：让客户提交询盘
3. **内容即销售** — 产品规格、认证、案例就是最好的销售话术
4. **多语言覆盖** — 不只是英文，要覆盖目标市场的本地语言
5. **AI可发现** — 让ChatGPT、Perplexity等AI搜索工具能推荐你

---

## 三、核心提示词

### 提示词1：B2B制造商首页结构优化

```
请按照B2B制造商网站最佳实践，优化首页结构。首页是转化漏斗的起点，每个模块都有明确目的。

标准首页模块顺序（从上到下）：

1. 【Hero区】— 3秒内告诉访客"你是谁、做什么、为什么选你"
   - 大标题：一句话定位（如 "Professional [产品] Manufacturer in China"）
   - 副标题：核心卖点（如 "XX Years Experience | XX+ Countries | OEM/ODM Available"）
   - 双CTA按钮：Get a Quote（主） + View Products（次）
   - 信任行：Free Samples | Low MOQ | 24h Reply | OEM Available
   - 右侧：产品实拍图或产品矩阵图

2. 【认证信任条】— 快速建立初始信任
   - 5-6个认证图标（CE/ISO/FDA/SGS/BSCI/TUV）
   - 绿色小勾 + 认证名称
   - 一行横排，灰色或浅色背景突出

3. 【产品分类卡片】— 引导进入产品页
   - 6-8个分类，圆形或方形图标/产品图
   - 分类名 + 产品数量
   - 点击进入对应分类页

4. 【热销产品】— 展示核心产品
   - 4-8个热销产品卡片
   - 产品图 + 名称 + 一句话卖点 + "View Details" 按钮
   - Bestseller / New 标签

5. 【Why Choose Us】— 6项差异化优势
   - 图标 + 标题 + 一句话说明
   - 建议方向：工厂直供、质量认证、定制服务、快速交付、专业团队、售后保障
   - 附带4个数据展示：建厂年份、年产能、出口国家数、服务客户数

6. 【下单流程】— 降低采购心理门槛
   - 4步图示：Inquiry → Sample → Order → Delivery
   - 每步一句话说明
   - 让采购商知道"跟你合作很简单"

7. 【CTA Banner】— 中段转化推动
   - 一句行动号召 + Get a Quote 按钮
   - 渐变色背景，视觉突出

8. 【FAQ】— 回答采购商最关心的6个问题
   - MOQ是多少？
   - 你们有什么认证？
   - 交货期多长？
   - 支持OEM/ODM定制吗？
   - 可以提供样品吗？
   - 你们的质量控制流程是什么？

请根据客户行业【行业】定制以上每个模块的具体内容。
```

### 提示词2：产品详情页行业标准

```
请按照B2B制造商产品详情页最佳实践，优化产品页结构和内容。

产品：【产品名称和型号】
行业：【行业】

标准产品详情页结构：

1. 【面包屑导航】
   Home > Products > [分类名] > [产品名]

2. 【产品主区域】（左右分栏）
   左侧：产品大图（支持点击放大）+ 角标（Bestseller/New/CE Certified）
   右侧：
   - 产品名称（H1）
   - 型号编号
   - 一句话产品描述（前40-60词包含直接答案，适配AI搜索）
   - 关键卖点（3-4个图标+文字）
   - "Send Inquiry" 按钮（橙色，醒目）
   - "Email Us" 按钮（次要）
   - 信任标签：Free Samples | Fast Delivery | OEM Available

3. 【规格参数表格】— 最重要的内容
   | Parameter | Value |
   |-----------|-------|
   | Material | ... |
   | Size | ... |
   | Weight | ... |
   | Color | ... |
   | Standard | ... |
   | NRR/SNR | ... |
   | MOQ | ... |
   | Package | ... |
   | Certification | ... |

4. 【产品特点】— 3-5条带图标的卖点

5. 【应用场景】— 适用行业/场景列表

6. 【询盘表单】— 内嵌在页面底部
   - 预填当前产品名称
   - 字段：姓名、邮箱、公司、国家、数量、留言

7. 【相关产品推荐】— 同分类其他产品，4个卡片

8. 【Schema结构化数据】
   - Product Schema（name, description, image, brand, manufacturer）
   - BreadcrumbList Schema

请为这个产品生成完整的详情页内容（英文）。
```

### 提示词3：行业定制FAQ生成

```
请为以下行业的B2B制造商网站生成FAQ内容：

行业：【行业，如听力防护/工业设备/电子元件】
产品类型：【具体产品】
客户类型：海外采购商、经销商、品牌商

生成要求：

1. 首页FAQ（6个，通用型）：
   - 覆盖：MOQ、认证、交期、定制、样品、质控
   - 回答简洁有力，50-100词英文
   - 包含具体数据（如 "Our MOQ is 500 pieces" 而非 "We have flexible MOQ"）

2. 产品页FAQ（每个产品3个，产品相关）：
   - 覆盖：产品用途、规格对比、如何选择
   - 包含技术参数

3. 行业知识FAQ（6个，长尾SEO用）：
   - 覆盖采购商常搜的行业问题
   - 如："What is the difference between NRR and SNR?"
   - 回答 100-200词，适合AI搜索引用

4. 输出格式：
   - 纯文本版（用于页面内容）
   - FAQPage Schema JSON-LD 版（用于结构化数据）

5. 同时生成5语言版本的FAQ标题翻译（英/西/法/阿/俄）
```

### 提示词4：行业博客文章策略

```
请为以下行业的B2B制造商网站制定博客内容策略，并生成文章。

行业：【行业】
目标市场：【如全球B端、欧美重点】
客户类型：采购商、经销商、品牌商

一、内容策略（生成文章选题清单）

请按以下4个方向各生成3个选题（共12个），按优先级排序：

方向1：采购指南（吸引正在找供应商的买家）
- 如 "How to Choose the Right [产品] Supplier in China"
- 如 "Complete Buying Guide for [产品]: What You Need to Know"

方向2：产品对比/评测（吸引正在做决策的买家）
- 如 "[产品A] vs [产品B]: Which is Better for [场景]?"
- 如 "Top X [产品] for [应用] in 2026"

方向3：行业知识/标准（建立专业权威）
- 如 "Understanding [行业标准] Certification for [产品]"
- 如 "A Complete Guide to [行业规范]"

方向4：应用场景/解决方案（展示专业性）
- 如 "How [产品] Improves [效果] in [行业]"
- 如 "X Ways to Optimize [流程] with [产品]"

二、文章生成（选出前3篇立即生成）

每篇文章要求：
- 1500-3000词英文
- 面向B端采购决策者（非终端消费者）
- 包含：小标题、编号列表、统计数据（每150-200词一个数据点）、对比表格
- 自然植入2-3个目标关键词
- 结尾CTA引导询盘
- Article Schema 结构化数据
- 5语言标题和摘要翻译
```

### 提示词5：信任体系建设

```
请为B2B制造商网站建立完整的信任体系，这是海外采购商最看重的因素。

客户公司：【公司名】
行业：【行业】
已有认证：【CE/ISO/FDA等】
成立年份：【年份】
年产能：【数据】
出口比例：【百分比】

请设计和生成以下信任元素：

1. 【首页信任条】
   - 5-6个认证图标 + 名称（一行横排）
   - 建议样式：灰色图标 + 绿色小勾

2. 【数据展示区】（Why Us部分）
   - 4个核心数据：
     - 建厂 XX+ 年
     - 年产 XX 件
     - 出口 XX+ 国家
     - 服务 XX+ 客户
   - 数字要大、醒目

3. 【Quality/认证页面】
   - 认证列表（每个认证：图标 + 名称 + 编号 + 适用标准 + 有效期）
   - 质量控制流程（6步：原料检测 → 生产监控 → 半成品抽检 → 成品全检 → 包装检验 → 出货前检测）
   - 标准对照表（产品适用的国际标准）

4. 【About页面信任元素】
   - 公司发展历程（时间线）
   - 工厂/产线照片区（需客户提供）
   - OEM/ODM能力说明
   - 合作客户logo墙（需客户提供）

5. 【产品页信任标签】
   - 每个产品详情页显示：Free Samples | 24h Response | OEM Available
   - 已认证产品显示认证标签（CE Certified / ANSI Tested）

6. 【页脚信任信息】
   - 公司全称 + 地址
   - "Verified Supplier since [年份]"
   - 认证小图标

请生成以上所有元素的英文文案内容，以及对应的5语言翻译。
```

### 提示词6：GEO优化（AI搜索专项）

```
请针对AI搜索引擎（ChatGPT、Perplexity、Claude等）优化网站内容，确保我们的产品和公司能被AI推荐。

公司：【公司名】
行业：【行业】
产品：【产品类型】

GEO优化执行清单：

1. 产品描述AI友好化：
   - 每个产品描述的前40-60词必须是"直接答案"格式
   - 示例："The SA-7-5 is a standard bullet-shape foam ear plug manufactured by [品牌], offering 38dB SNR and 31dB NRR noise reduction. Made from slow-rebound polyurethane foam, it provides..."
   - 不要营销腔，要百科式客观描述

2. FAQ内容优化：
   - 问题用自然语言（像用户问AI的方式）
   - 回答第一句就给出直接答案
   - 包含具体数据和参数

3. 产品规格表格化：
   - 所有产品规格必须用HTML表格呈现
   - AI爬虫更容易抓取表格数据

4. 博客文章数据密度：
   - 每150-200词包含一个具体数据点
   - 包含对比表格（如不同产品/标准的对比）
   - 引用行业标准（EN352-2, ANSI S3.19等）

5. robots.txt AI爬虫白名单：
   确保以下7个AI爬虫被允许：
   GPTBot, ChatGPT-User, Google-Extended, PerplexityBot,
   ClaudeBot, Amazonbot, Meta-ExternalAgent

6. llms.txt 文件内容：
   ```
   # [公司名]
   > [一句话定位]
   
   ## About
   [2-3句公司介绍]
   
   ## Products
   - [分类1]: [产品列表]
   - [分类2]: [产品列表]
   ...
   
   ## Certifications
   [认证列表]
   
   ## Contact
   - Email: [邮箱]
   - Phone: [电话]
   - WhatsApp: [号码]
   - Address: [地址]
   - Website: [网址]
   ```

7. 验证方法：
   - 在ChatGPT中搜索"[行业] manufacturer in China"
   - 在Perplexity中搜索"best [产品] supplier"
   - 检查是否能找到我们的信息
```

---

## 四、行业定制检查清单

### 类型A：B2B制造商必备清单（PPE/工业品/消费品）

- [ ] 首页8大模块完整
- [ ] 产品详情页含规格参数表格
- [ ] 至少5个询盘入口
- [ ] 认证/质量页面
- [ ] FAQ 6个行业相关问答
- [ ] 3篇SEO博客文章
- [ ] **5语言支持（英/西/法/阿/俄）+ 阿拉伯语RTL布局**
- [ ] Schema结构化数据（5种）
- [ ] llms.txt + AI爬虫白名单
- [ ] 感谢页 + GA4转化追踪
- [ ] WhatsApp悬浮按钮
- [ ] 退出意图弹窗（桌面端）
- [ ] 产品对比功能
- [ ] Privacy Policy页面（多语言）

**按细分行业补充：**

| 行业 | 额外要求 |
|------|---------|
| PPE/安全防护 | 认证标准对照表（EN/ANSI/AS）、NRR/SNR对比、佩戴方式图示 |
| 电子元件 | 数据手册下载、兼容性说明、选型指南 |
| 建材五金 | 项目案例、安装指南、工程量计算器 |
| 化工材料 | MSDS下载、储运说明、混配表 |
| 食品设备 | 食品级认证（FDA/NSF）、清洁指南 |
| 服装纺织 | 面料色卡、定制流程说明、MOQ阶梯表 |

### 类型B：B2B工业设备商必备清单（机械/设备/生产线）

- [ ] 首页8大模块完整（Hero区强调"解决方案"而非"产品目录"）
- [ ] **Solutions页面** — 按场景组织（3-6个方案）
- [ ] **Applications页面** — 按行业组织（5-10个应用行业）
- [ ] 产品详情页含技术参数表格 + 适用方案链接
- [ ] 至少5个询盘入口
- [ ] 认证/质量页面
- [ ] FAQ 6个行业相关问答（偏方案咨询型）
- [ ] 3篇SEO博客文章（偏行业解决方案型）
- [ ] **3语言支持（英/西/法）— 不做阿语和俄语**
- [ ] Schema结构化数据（5种）
- [ ] llms.txt + AI爬虫白名单
- [ ] 感谢页 + GA4转化追踪
- [ ] WhatsApp悬浮按钮
- [ ] 视频占位区块（工厂视频/设备运行视频更重要）
- [ ] Privacy Policy页面（多语言）

**Solutions页面结构：**
```
/[lang]/solutions/
├── /[lang]/solutions/noise-control/      ← 方案1
├── /[lang]/solutions/dust-treatment/     ← 方案2
├── /[lang]/solutions/automation-upgrade/ ← 方案3
└── ...
每个方案页包含：
- 问题描述（客户痛点）
- 解决方案概述
- 推荐产品组合（链接到产品详情页）
- 应用案例（如有）
- 技术参数对比表
- CTA：Request Solution Quote
```

**Applications页面结构：**
```
/[lang]/applications/
├── /[lang]/applications/mining/          ← 行业1
├── /[lang]/applications/oil-gas/         ← 行业2
├── /[lang]/applications/food-processing/ ← 行业3
└── ...
每个行业页包含：
- 行业背景和挑战
- 适用产品列表（链接到产品详情页）
- 该行业的成功案例/客户见证（如有）
- 行业专属认证和标准
- CTA：Discuss Your Project
```

**类型B与类型A的关键差异汇总：**

| 维度 | 类型A（制造商） | 类型B（设备商） |
|------|---------------|---------------|
| 语言数量 | 5语言 + RTL | 3语言，无RTL |
| 导航结构 | Products为核心 | Solutions + Applications为核心 |
| Hero文案 | "Professional [产品] Manufacturer" | "Industrial [方案] Solutions Provider" |
| 询盘表单 | 产品名预填 | 方案名/行业预填 |
| 博客方向 | 采购指南、产品对比 | 行业趋势、方案白皮书 |
| FAQ风格 | "MOQ多少？" | "你们能解决XX问题吗？" |
| 信任重点 | 认证+产能+出口量 | 案例+行业经验+技术团队 |

---

## 四点五、重型设备 B2B 产品页 12 板块体系（v2.8 新增 / 2026-04-29）

> **触发**：客户 002 demo-c.com 反馈3.docx 业务模型升级 — 重型设备买家不看"参数表+描述"，看"完整决策包"
> **适用**：单台投资 USD 30K+ 的重型设备（EPS / 化工 / 包装机械 / 食品机械 / ICF / 注塑机 / 自动化产线）
> **不适用**：轻消费品 / B2C / 一般 PPE / 普通制造商（严重过载）

### 业务模型 → 12 板块判定

| 业务模型 | 是否上 12 板块 |
|---|---|
| Pure Manufacturer（重型设备） | ✅ 必上 |
| Solution Integrator（整线方案商） | ✅ 必上（产品 hub 页用 12 板块；Solution 页另一套结构）|
| OEM-ODM（重型订制） | ✅ 必上 |
| Brand Owner（重型工业品） | ✅ 必上 |
| Pure Manufacturer（消费品 / PPE / 服装） | ❌ 不要用 |
| Trader / Material Supplier | ❌ 不要用 |
| Service Provider | ❌ 不适用 |

### 12 板块（按买家决策路径排序）

1. **What This Machine Solves** — 痛点-方案叙事块（3 条，Hero 后第一节，必带数字）
2. **Working Principle** — 流程图 + 5-6 步骤工序（每步带具体参数）
3. **Engineered Performance Advantages** — 数据化优势（4-6 卡，每条 metric+value+baseline+description，禁泛泛）
4. **Full Specifications** — 完整参数表（必填 cycle time / steam / energy / output / power / dimensions）
5. **Machine Configuration** — OEM 一览（PLC/Hydraulic/Sensor 品牌：Siemens/Yuken/Burkert/Mettler Toledo）
6. **Applications + Real Photos** — 终端产品真实场景图（不是泛泛标签云）
7. **Customer Case Studies** — 1-3 真实案例（国家+年份+配置+outcome 必含）
8. **Factory Strength** — 4 数据卡（年限 / 车间面积 / 出口国数 / 装备工厂数）— 全站默认
9. **Service Commitment** — 4 服务卡（5 年质保 / 24h 远程 / 全球技师 / 操作员培训）— 全站默认
10. **ROI Snapshot** — 投资 + 回本 + 产能 3 数据 + 链向 ROI Calculator
11. **FAQ** — 4-6 高频问题（FAQPage Schema → AI Overviews 引用率）
12. **Final CTA** — 多触点询盘转化（产品页至少 5 触点）

### 实施流程（老站二轮改造 / 新建站皆适用）

**Step 1 — 业务模型判定**
对照上表，确认客户在「✅ 必上 12 板块」象限。如果不是，用标准 8 板块产品页即可。

**Step 2 — 选 Top 5 高流量产品（老站 GSC 数据 / 新建站客户提供）**
- 老站：跑 `gsc_search_performance(dimension=page, days=28, limit=50)` 取 page 维度展示数 Top 5
- 新建站：客户提供"最想推的 5 个旗舰产品"

**Step 3 — 填充 deep-dive 数据（products-deep-dive.ts）**
- 模板见 starter `src/data/products-deep-dive.ts`
- 7 个字段（problemsSolved / workingPrinciple / metricsAdvantages / configuration / applicationPhotos / caseStudies / roiBaseline）
- EN 优先，5 语种走并行翻译管道（B 升级，下一节）

**Step 4 — 模板挂接**
- starter 已挂接到 `Standard.astro`（默认）
- FullWidth.astro / Sidebar.astro 需手动 import `<DeepDiveSections>` 组件
- 全站默认（Factory Strength + Service Commitment）即使产品 deep-dive 数据空也显示 — 所有产品页都受益

**Step 5 — Top 5 验证窗口（14 天）**
- 上线后 7-14 天看 GSC CTR / GA4 view_item 转化
- 提升明显 → 推广到剩余产品
- 无提升 → 该客户买家不看 12 板块（罕见，但要尊重数据）

### 反面案例：v1.0 单薄产品页的代价

demo-c.com v1.0（2025-04-2026-04）：
- 产品页只有 8 sections，Features 是泛泛"PLC 控制 / 节能高效"，0 数据
- Applications 只有标签云无图
- 0 案例 / 0 工厂实力 / 0 服务承诺 / 0 ROI
- 客户 GSC 平均排名 13.x / CTR 持续 0% / 询盘转化低
- 客户 4-29 主动反馈"建议添加 12 板块"= 损失流量数月

### 数据 schema + 配套资产

- 详细 schema：`经验库/通用教训/产品页 12 板块-重型设备 B2B.md`
- starter 模板：`astro-b2b-starter/src/data/products-deep-dive.ts` + `src/components/DeepDiveSections.astro`
- 自动 QA：`scripts/build-qa.sh` #35 检查 12 板块完整性
- 实战案例：客户 002 demo-c.com v2.0（2026-04-29）

---

## 五、注意事项

1. **先判断行业类型再动手** — 类型A和类型B的策略差异很大，搞错了等于返工
2. **信任建设需要真实素材** — 认证证书、工厂照片、客户案例不能造假，缺失就标注"待客户提供"
3. **数据展示要具体** — "10+ years" 比 "many years" 好，"200M+ units/year" 比 "large capacity" 好
4. **FAQ要像真人会问的** — 不要学术化，要像采购经理在微信里问的那种问题
5. **博客不是凑数** — 每篇文章都要解决采购商的一个实际问题
6. **GEO是新战场** — 2026年越来越多采购商用AI搜索找供应商，提前布局
7. **行业标准要准确** — CE EN352-2、ANSI S3.19 这些标准编号不能写错
8. **类型B的语言不要过多** — 工业设备3语言足够，多了反而增加维护成本且目标市场不匹配
9. **Solutions/Applications页面也要做SEO** — 每个方案页和行业页都需要独立title、description和Schema

---

*独立站建站智能体 · 独立站技能库 · 行业强化技能*
