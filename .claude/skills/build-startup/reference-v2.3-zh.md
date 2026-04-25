---
name: 建站启动
description: 接到新客户建站需求时，从需求确认、fork starter模板、site.config.ts配置到项目就绪的完整启动流程
---

# 建站启动技能 v2.4 — 从客户信息到项目就绪

> 适用场景：接到新客户建站需求时，从需求确认到 fork starter、填写 site.config.ts、选择功能开关的完整启动流程。
> 使用者：独立站建站智能体（内部）
> 更新时间：2026-04（v2.3）→ **2026-04-17 v2.4 升级**

---

## 🚨 v2.4 升级补丁（本技能核心变更）

### 触发事件

2026-04-17 Demo-A v1 MVP（115 页手搓）客户满意 vs v2 v2.3 满配（4441 页）客户反馈"乱、像草稿、像模板拼贴"。根因：**建站启动阶段跳过业务叙事建模直接套蓝图**。

### 本技能新增：业务叙事建模（必做前置 · 最重要）

**工作顺序变化**：

```
旧（v2.3，错）：客户信息 → 选行业蓝图 → fork starter → 套 site.config.ts → 完工
新（v2.4，对）：客户信息 → 【业务叙事建模】→ 输出叙事档案 → fork starter → site.config.ts 按档案填 → 完工
                        ↑
                     新增步骤
```

### 业务叙事建模 4 步（本技能的新第一章）

**参考文档**：
- [业务叙事建模.md](../../../业务叙事建模.md) — 完整方法论
- [叙事档案模板.md](../../../叙事档案模板.md) — 填写模板

**Step 1 · 业务模型判定（7 选 1）**：
问客户 5 个问题，在 Pure Manufacturer / Solution Integrator / OEM-ODM / Brand Owner / Trader / Material Supplier / Service Provider 里判定一个。判错此步后面全错。

**Step 2 · 叙事单元提取（3-5 个）**：
用三问法（为什么选你 → 为什么比别家好 → 证据是什么），提取只有这个客户讲得出的故事。通过"去名测试"：去掉公司名同行不能直接套用。

**Step 3 · 叙事 → 页面反推**：
每个叙事单元必须回答：
- 是 section 能装下还是需要独立页？
- 现有 27 个 variant 有匹配吗？没有则新造。
- 首页 section 总数必须 ≤ 7。

**Step 4 · 产出《业务叙事档案.md》**：
路径：`客户/独立站-客户XXX/业务叙事档案.md`
套用模板 [叙事档案模板.md](../../../叙事档案模板.md) 的 8 节结构。

### 硬规则（v2.4 新增）

- ❌ **禁止未产出叙事档案就 handoff 给 build-execution**
- ❌ **禁止直接用蓝图 `home: [...]` 默认列表**（v2.4 蓝图已改名 `suggestedHome`，只能作为参考菜单）
- ❌ **禁止功能开关全开**（productWizard / roiCalculator / programmaticSEO / exitIntent 默认 false，按叙事档案第 5 节逐个判定）
- ❌ **禁止方形产品图配 `full-width` 产品页布局**（必须用 `standard`，防 Demo-A 通图事件）

### 本技能的交付标准（v2.4）

启动阶段结束时必须具备：

- [ ] 业务模型判定（7 选 1 + 5 问答案表）
- [ ] 3-5 个叙事单元 + 独特性证据 + 承载形式
- [ ] 最终页面地图（首页 section ≤ 7 + 独立页清单）
- [ ] 功能开关决策表
- [ ] site.config.ts 填写完成（layout 按档案反推结果，非蓝图默认）
- [ ] 反模板复刻自检 5 问已过（第 1 问必答"不能"）

### 对照失败案例

| 案例 | 业务模型判定 | 叙事档案 | 结果 |
|---|---|---|---|
| Demo-A v1（手搓 MVP） | ✅ Solution Integrator | ❌ 无（靠直觉做对了）| 客户满意（结构清晰）|
| **Demo-A v2（v2.3 满配）** | ❌ **误判为 Pure Manufacturer** | ❌ **跳过** | **客户不满（乱、草稿）** |
| v2.4 之后 | ✅ 必判定 | ✅ 必产出 | 持续验证中 |

---

## 一、使用场景

- 新客户签约后，启动独立站建设项目
- 客户提供了基本信息（公司名、行业、参考网站等）
- 需要快速 fork starter 模板、配置 site.config.ts，让项目进入可执行状态

---

## 二、启动流程（按顺序执行）

### 第1步：需求确认 + 客户数据加载

先通过 client-manager 加载客户数据：

```
client-manager.search_clients(客户名) → get_client(id)
→ 获取：公司信息、产品线、认证、联系方式、目标市场、语言列表
```

如果 client-manager 中无该客户，向客户确认以下信息（微信/邮件均可）：

| 必填项 | 说明 |
|--------|------|
| 公司中文名 + 英文名/品牌名 | 用于网站全局 |
| 主营产品（大类） | 决定网站结构和主题预设 |
| 参考网站（如有） | 用于 site-analyzer 提取视觉DNA |
| 联系人 + 邮箱 + 电话 + WhatsApp | 网站联系页 + 询盘接收 |
| 域名（如已注册） | 用于 SEO 配置 |
| 目标市场 | 决定语言和内容方向 |
| 资质认证（ISO/CE/FDA等） | 信任区展示 |

**如果客户信息不全，发送素材收集清单（见下方提示词2）。**

### 第2步：Fork Starter 模板

从 astro-b2b-starter 复制到客户项目目录：

```bash
# 源模板
智能体/建站/astro-b2b-starter/

# 目标位置
客户/独立站-客户XXX/website/

# 执行
cp -r 智能体/建站/astro-b2b-starter/ 客户/独立站-客户XXX/website/
```

最终项目结构：

```
客户/独立站-客户XXX/
├── CLAUDE.md          ← 项目级配置（建站进展、客户沟通记录）
├── 素材整理.md         ← 抓取/整理的客户素材
└── website/           ← 网站源码（fork自starter）
    ├── site.config.ts ← 【核心】一文件定义全站
    ├── src/
    │   └── styles/
    │       └── global.css  ← @theme 品牌色覆盖
    ├── astro.config.mjs
    ├── package.json
    └── ...
```

### 第3步：行业布局方案设计（关键步骤）

**这是 v2.2 最重要的思考环节。禁止跳过。禁止凭经验猜测。所有设计决策必须基于竞品数据。**

astro-b2b-starter 提供的是 DNA 层（Schema/GA4/GEO/转化系统）和组件库，**不是固定的页面布局**。每个客户的首页结构、产品页重点、信任体系方式都必须根据行业特点定制。

#### 3.0 竞品网站分析（强制前置步骤，禁止跳过）

**在回答任何设计问题之前，必须先抓取 3-5 个同行业的竞品/标杆网站。**

```
执行步骤：
1. 确定竞品列表：
   - 客户提供的竞品（如有）
   - 搜索 "[客户行业] manufacturer website" 找到 3-5 个行业标杆
   - 优先选择：行业TOP企业（如胶粘剂找Henkel/3M）+ 同规模中国出口商

2. 用 fetch 逐个抓取每个竞品的 3 个页面：
   - 首页（整体结构和模块顺序）
   - 产品页/产品列表页（分类方式和展示重点）
   - 关于页（信任体系怎么建立）

3. 提取并记录每个竞品的：
   - 首页模块顺序（从上到下列出每个区块）
   - 产品分类方式（按型号/按应用/按材料/按行业）
   - 产品页信息优先级（参数表在前还是应用场景在前）
   - 信任体系元素（认证/案例/数据/文档）
   - CTA文案和位置
   - 有没有特殊功能（选型工具/计算器/样品申请/文档下载）

4. 输出「竞品布局分析表」：

   | 竞品 | 首页模块顺序 | 产品分类方式 | 产品页重点 | 信任体系 | 特殊功能 |
   |------|------------|------------|----------|---------|---------|
   | 竞品A | ... | ... | ... | ... | ... |
   | 竞品B | ... | ... | ... | ... | ... |
   | 竞品C | ... | ... | ... | ... | ... |

5. 从竞品分析中总结行业共性：
   - 这个行业的网站普遍怎么做？（行业标准做法）
   - 哪些做法是行业独有的？（如化工的MSDS下载、机械的参数对比）
   - 哪些竞品做得好？好在哪里？
   - 哪些地方我们可以超越？
```

**竞品分析表必须保存到客户项目目录的 `竞品布局分析.md` 文件中。**

---

#### 3.1 行业分析四问（基于竞品数据回答，禁止凭经验猜测）

基于上面的竞品分析结果，回答以下 4 个问题（每个答案必须引用竞品数据支撑）：

```
Q1: 这个行业的采购商怎么找产品？
    竞品怎么做的？（引用竞品分析表中的"产品分类方式"列）
    → 这决定了我们的产品分类方式和导航结构

Q2: 首页最重要的模块是什么？
    竞品首页普遍包含哪些模块？顺序是什么？（引用"首页模块顺序"列）
    哪些模块是行业标配？哪些是差异化的？
    → 这决定了我们的首页模块顺序和权重

Q3: 产品页最重要的信息是什么？
    竞品产品页的信息排列顺序是什么？（引用"产品页重点"列）
    什么信息放在最显眼位置？什么信息被弱化？
    → 这决定了我们产品详情页的布局和内容重点

Q4: 信任体系靠什么建立？
    竞品用了哪些信任元素？（引用"信任体系"列）
    有没有行业特有的信任方式？（如化工的MSDS、医疗的GMP）
    → 这决定了信任区展示内容和Quality页面结构
```

**每个答案必须写明"根据竞品A/B/C的做法，我们采取..."，禁止使用"通常"、"一般来说"这类没有数据支撑的表述。**

#### 3.2 输出：页面布局方案

回答完四问后，输出一份页面布局方案，包含：

```markdown
## [客户名] 页面布局方案

### 首页模块顺序（从上到下）
1. Hero区：[描述风格和核心文案方向]
2. [模块2名称]：[为什么放这里]
3. [模块3名称]：[为什么放这里]
...

### 产品分类方式
- [分类逻辑说明]
- [类目列表]

### 产品详情页重点
- 核心信息区：[什么信息最重要]
- 信任元素：[展示什么认证/数据]
- 转化路径：[采购商看完后下一步做什么]

### 信任体系
- 首页信任条：[展示什么]
- Quality页面：[重点展示什么]
- 产品页信任标签：[每个产品旁边显示什么]

### 与默认模板的差异
- [列出需要修改默认模板的地方]
```

**此方案必须与客户确认后才能进入建站执行。**

#### 3.3 实施方式

布局方案确认后，在 build-execution 阶段：
- 修改 `src/pages/[locale]/index.astro`（首页）按方案调整模块顺序和内容
- 修改 `src/pages/[locale]/products/[slug].astro`（产品页）按方案调整信息重点
- 如果需要新的页面类型（如化工的"Applications by Material"页），新建页面文件

**starter 的 DNA 层（Schema/GA4/GEO/转化系统/BaseLayout）不动，只调整页面层的布局和内容结构。**

---

### 第4步：填写 site.config.ts

这是 v2.3 的核心变化 — **site.config.ts 是项目的唯一配置源**，不再在代码中硬编码客户信息。

用 client-manager 获取的数据自动填入以下字段：

| 配置块 | 字段 | 数据来源 |
|--------|------|---------|
| `company` | 公司名、地址、电话、邮箱、WhatsApp | client-manager |
| `theme` | 主题预设（5选1） | 行业判断 + 参考站分析 |
| `languages` | 语言列表 + 默认语言 | 目标市场判断 |
| `features` | 功能开关 | 客户类型判断（见第4步） |
| `certifications` | 资质认证列表 | client-manager |
| `targetMarkets` | 目标市场 | client-manager |
| `analytics` | GA4 ID、GTM ID | 客户提供或后期补填 |
| `form` | 表单接收邮箱、字段配置 | client-manager |
| `seo` | 域名、默认title格式 | 客户确认 |

### 第5步：选择功能开关

根据客户类型选择功能组合：

| 客户类型 | 典型行业 | 推荐功能 |
|----------|---------|---------|
| **设备制造商（B类）** | 机械、自动化、环保设备 | `productWizard` + `roiCalculator` + `solutions` + `stepForm` |
| **产品制造商（A类）** | 日用品、建材、电子元件 | `stepForm` + `catalogDownload` + `sampleRequest` + `productCompare` |
| **化工材料商（C类）** | 胶粘剂、涂料、树脂、化学品 | `sampleRequest` + `catalogDownload` + `stepForm` + `applications` + `blog`（MSDS/TDS下载是化工刚需） |
| **所有客户（默认开启）** | — | `exitIntent` + `blog` |

在 site.config.ts 中设置：

```typescript
features: {
  // === 设备制造商（B类）推荐 ===
  productWizard: false,     // 产品选型向导
  roiCalculator: false,     // ROI计算器
  solutions: false,         // 解决方案页
  
  // === 产品制造商（A类）推荐 ===
  catalogDownload: false,   // PDF手册下载门控
  sampleRequest: false,     // 样品申请
  productCompare: false,    // 产品对比
  
  // === 按需开启 ===
  stepForm: true,           // 分步询价表单（推荐所有客户）
  caseStudies: false,       // 案例展示（有素材时开）
  applications: false,      // 应用场景页
  videoEmbed: false,        // 视频嵌入（有视频素材时开）
  liveChat: false,          // 在线客服（客户有人回复时开）
  aiAdvisor: false,         // AI产品顾问
  programmaticSEO: false,   // 程序化SEO长尾页
  
  // === 所有客户默认开启 ===
  exitIntent: true,         // 退出弹窗
  blog: true,               // 博客
}
```

### 第5.1步：选择行业蓝图（v2.3 模块化布局系统）

starter 提供 6 套行业蓝图，每套预定义了首页模块组合 + 产品页布局。**基于竞品分析的结果选择最接近的蓝图，然后按需调整。**

```
6套行业蓝图（layout-blueprints.ts）：

heavy-equipment  → 重型设备（EPS设备/注塑机/CNC/包装机械）
                   Hero:image-overlay + trust-bar + advantages:alternating + factory:video + stats:counter + process:timeline
                   产品页：full-width

consumer-goods   → 消费品（日用品/家居/文具/包装）
                   Hero:split + trust-bar:card + products:grid + logos:scroll + advantages:icon-grid
                   产品页：standard

building-materials → 建材（石材/门窗/地板/陶瓷）
                   Hero:image-overlay + products:featured + factory:gallery + logos:grid + process:steps
                   产品页：sidebar

electronics      → 电子（LED/传感器/PCB/连接器）
                   Hero:gradient + trust-bar:inline + products:grid + stats:infographic + process:cards
                   产品页：standard

food-medical     → 食品/医疗（食品设备/医疗器械/制药）
                   Hero:split + trust-bar:card + advantages:alternating + testimonials:cards + process:timeline
                   产品页：standard

chemical-materials → 化工材料（胶粘剂/涂料/树脂/化学品/精细化工）
                   Hero:image-overlay + trust-bar + products:featured + advantages:alternating + process:steps + factory:gallery + stats:counter + testimonials:cards + faq:two-column + cta:split-form
                   产品页：full-width（化工产品需完整规格：MSDS/TDS/应用范围/技术参数）
                   配套主题：chemical-trust（深蓝绿+安全橙）
                   化工买家决策链：安全合规→技术参数→产能保障→应用验证→样品试用
```

**选择规则**：
1. 如果客户行业完全匹配某个蓝图 → 直接使用
2. 如果不完全匹配 → 选最接近的蓝图作为起点，根据竞品分析调整模块
3. 如果行业非常独特 → 不用蓝图，手动配置 layout.home 数组

在 `site.config.ts` 中设置：

```typescript
import { blueprints } from './layout-blueprints';

// 方式A：直接使用蓝图
layout: blueprints['consumer-goods'],

// 方式B：基于蓝图微调
layout: {
  ...blueprints['consumer-goods'],
  home: [
    ...blueprints['consumer-goods'].home,
    { type: 'factory', variant: 'gallery' },  // 额外加一个工厂展示模块
  ],
},

// 方式C：完全自定义（不用蓝图）
layout: {
  home: [
    { type: 'hero', variant: 'gradient' },
    { type: 'products', variant: 'grid' },
    { type: 'faq', variant: 'default' },
    { type: 'cta', variant: 'gradient-banner' },
  ],
  productDetail: 'standard',
},
```

**首页自动渲染**：starter 的首页使用 `SectionRenderer` 组件，根据 `layout.home` 数组自动渲染对应的 Section 变体，无需手写首页 HTML。

---

### 第6步：配置品牌色

在 `website/src/styles/global.css` 的 `@theme` 块中覆盖品牌色：

```css
@theme {
  --color-primary: #2563eb;        /* 主色 — 从主题预设或客户品牌取 */
  --color-primary-dark: #1e40af;   /* 主色深 */
  --color-primary-light: #3b82f6;  /* 主色浅 */
}
```

颜色来源优先级：
1. 客户品牌手册指定色
2. 参考站分析提取色（site-analyzer）
3. 主题预设默认色

### 第7步：AI Advisor 配置（如启用）

如果 `features.aiAdvisor: true`，需要额外配置：

```typescript
aiAdvisor: {
  workerUrl: "https://ai-advisor.example.workers.dev",
  // 产品知识库在 build-execution 阶段填充
}
```

同时在 Cloudflare Worker 端添加客户域名到 `ALLOWED_ORIGINS`：

```
客户域名 → 添加到 ai-advisor Worker 的 ALLOWED_ORIGINS 环境变量
```

### 第8步：创建项目 CLAUDE.md

site.config.ts 是技术配置源，CLAUDE.md 用于记录项目级信息：

- 客户沟通记录
- 建站进展节点
- 待确认事项
- 特殊需求备注

### 第9步：确认启动

与客户书面确认以下事项后，进入建站执行阶段：
- 网站定位确认（B2B询盘型）
- **语言版本确认（根据目标市场判断，不固定5种语言）**
- 产品分类确认
- 参考网站/风格偏好确认
- 主题预设确认（可展示6套预设给客户选）

> **语言方案说明：**
> 不要默认所有客户都做5种语言（英/西/法/阿/俄），要根据目标市场实际判断：
> - 目标市场是欧美 → 英语为主，可加西/法/德
> - 目标市场是中东 → 英语 + 阿拉伯语
> - 目标市场是东南亚 → 英语即可，部分市场可加泰语/越南语
> - 目标市场是全球 → 英语 + 3-5种覆盖主要市场的语言
> - 语言数量影响工作量和维护成本，要跟客户沟通确认，不要自作主张

---

## 三、核心提示词

### 提示词1：填写 site.config.ts

```
请为新客户填写 site.config.ts，使用以下信息：

客户信息：
- 公司：【中文名】
- 英文名/品牌：【英文名】
- 地址：【地址】
- 主营产品：【产品类型】
- 联系人：【姓名】
- 邮箱：【邮箱】
- 电话：【电话】
- WhatsApp：【号码】
- 认证资质：【ISO/CE/FDA等】

网站定位：
- 类型：B2B询盘型独立站
- 目标市场：【如：全球B端、欧美重点】
- 参考网站：【URL】
- 域名：【域名】
- 客户类型：【A类产品制造商 / B类设备制造商】

请完成以下配置：
1. 填写 company/seo/form/targetMarkets/certifications 字段
2. 根据行业选择主题预设（industrial-dark/clean-minimal/tech-modern/warm-trust/premium-luxury）
3. 根据目标市场确定 languages 列表
4. 根据客户类型设置 features 功能开关
5. 在 global.css @theme 中设置品牌色
```

### 提示词2：发送素材收集清单给客户

```
请生成一份给客户填写的素材收集清单，中文，简洁易懂，包含：

一、公司基本信息（必填）
- 公司名称（中英文）、成立年份、公司简介、主营产品、年产能、工厂地址、出口情况

二、联系信息（必填）
- 业务邮箱、电话、WhatsApp、地址、联系人

三、产品信息（必填）
- 每个产品：名称、型号、分类、图片(2-3张白底高清)、规格参数、描述/卖点、认证、适用场景、是否热销/新品、MOQ、OEM/ODM
- 产品分类列表

四、证书资质（强烈建议）
- ISO 9001、CE、FDA、SGS、BSCI 等扫描件

五、视觉素材（有则提供）
- Logo、工厂照片、车间照片、团队照片、产品场景照

六、品牌偏好（可选）
- 喜欢的同行网站、偏好色调、域名、特殊需求

七、SEO相关（可选）
- 客户搜索词、主要竞品网站、目标客户类型、阿里/MIC店铺链接

格式要求：用表格，留空让客户填写，底部注明提交方式和3个工作日启动承诺。
```

---

## 四、6套主题预设速查

| 预设 | 适合行业 | 视觉特征 | 参考站 |
|------|---------|---------|--------|
| `industrial-dark` | 重工机械、设备制造 | 深色背景、大字体、硬朗线条 | xometry.com |
| `clean-minimal` | 日用品、消费品出口 | 白底、大留白、细线条 | muji.com |
| `tech-modern` | 电子、自动化、LED | 渐变背景、几何元素、科技感 | keyence.com |
| `warm-trust` | 食品、纺织、医疗 | 暖色调、圆角、人物照片 | medline.com |
| `premium-luxury` | 高端建材、定制家具 | 深色+金色、serif字体、大图 | rimadesio.com |
| `chemical-trust` | 胶粘剂、涂料、树脂、化工 | 深蓝绿+安全橙、专业稳重 | henkel.com / sika.com |

---

## 五、注意事项

1. **site.config.ts 是核心** — 它定义了全站配置，所有客户信息集中在此，不在代码中硬编码
2. **必须从 starter 模板 fork** — 禁止从零写或复制旧项目，起点统一为 `astro-b2b-starter/`
3. **client-manager 优先** — 客户信息优先从 client-manager 获取，避免手动输入遗漏
4. **客户确认要书面** — 微信截图或邮件回复"确认"即可，避免口头确认后扯皮
5. **不要等素材齐全才启动** — 先用参考网站/阿里巴巴抓取素材，客户素材后期替换
6. **域名未确定时用占位符** — `example.com`，上线前统一替换
7. **每个项目独立文件夹** — 命名格式：`独立站-客户XXX/` 或 `独立站-公司名/`
8. **项目进展实时记录** — 在 CLAUDE.md 中记录每个关键节点和客户确认事项

---

## 六、v2.5 前沿视觉默认配置（2026-04-25 升级）

> **来源事件**：客户两次反馈"白底单调"+"3 圆按钮所有站都这样"→ 从 starter 源头修，避免下个新客户站重蹈 v1 模板化覆辙。

### 新站默认必带（已写进 starter，零额外动作）

| 组件 | 位置 | 作用 | 关闭方式 |
|---|---|---|---|
| **ScrollProgress** | 顶部 3px 渐变进度条 | 长页面阅读位置反馈，B2B 多 Section 落地页尤其需要 | 暂无开关（建议保留） |
| **FloatingCTA v2** | 右下角 Intercom-style 单胶囊 | 点击展开 popup → WhatsApp / Email / Detailed Inquiry 三选项 + 响应时间承诺 + 多语种标识 | `<BaseLayout hideFloatingCTA={true}>` |
| **ExitIntent** | 桌面端鼠标移到顶部触发 | 一会话只弹一次，邮箱+提交直入询盘漏斗 | `features.exitIntent: false` |
| **Header backdrop-blur** | Sticky `#site-header` `bg-white/95 + backdrop-blur-md` | 滚动后 `is-scrolled` 加深模糊 + shadow，高级感 | 无（默认） |
| **Cards hover lift** | `.bg-white.rounded-{lg\|xl\|2xl}` 零 markup 升级 | hover 上浮 -4px + brand-color glow shadow | `prefers-reduced-motion` 自动关 |
| **SectionBackdrop bold mode** | `intensity="bold"` 加 mesh gradient + brand blob + radial mask | Hero / CTA / Stats 等需视觉重量的 section | 默认 `intensity="subtle"` 保持 v2.3 行为 |

### 启动时智能体必检三件

启动技能输出"项目就绪"前**必须确认 site.config.ts**：

1. `features.exitIntent` — v2.5 起默认 `true`，客户强反感才改 `false`
2. 品牌色 token（primary / primary-dark / accent）已根据 site-analyzer 产出填入 — 它们是 FloatingCTA 渐变 + ScrollProgress 渐变 + cards hover glow 的统一来源
3. `i18n.floatingCta.*` 9 个 key 每语种填齐：`trigger / close / title / subtitle / waPromise / emailSubject / emailPromise / inquiryTitle / inquiryPromise / langBadge`

### 与业务叙事的关系

视觉默认是**装饰层**，不替代业务叙事建模：

- 即使 v2.5 视觉满配，也必须先产出《业务叙事档案.md》才能进 build-execution（v2.4 硬规则不变）
- 视觉默认让"叙事正确的站"看起来不像草稿；不能让"叙事错的站"看起来像高端站

---

*独立站建站智能体 · 独立站技能库 · 建站启动技能 v2.5 · 2026-04-25*
