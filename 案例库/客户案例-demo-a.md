# 客户B · demo-a.com（冷链解决方案整合商）

> 2026-04-17 首次上线（v1→v2 返工）→ **2026-04-18 v3 按 v2.4 叙事档案重建上线**
> 独立站第二站 · 与主站 demo-c.com 并行独立运营
> **本案例是 v2.3 → v2.4 智能体升级的触发事件 · 永久保留作为反面教材活化石**

## 基本信息

- **客户ID**：client-B（client-manager）
- **项目目录**：`${WORKSPACE_ROOT}/客户/Demo-A-client-B2/`（独立 git，与主站 `Demo-C-client-B` 分离）
- **定位**：Cold Chain Solution Integrator（方案B 整合商模式，不是工厂自营）
- **语种**：6 语 — EN（默认）/ RU / ES / PT / FR / AR（AR 走 RTL）
- **目标市场**：俄语区 + 拉美 + 中东
- **页数**：v2.0 满配 3655 页（v1.0 MVP 只有 115 页，32 倍差距）

## 叙事规则（重要）

- **partner network / manufacturing network** — 禁止用 "our factory" 或暴露具体工厂名
- 整合了 5 家模具厂：Partner-1 / Partner-2 / Partner-3 / Partner-4 / Partner-5
- 联系方式**独立于主站**：`+86 +86-xxx-xxxx-xxxx` / `info@demo-a.com`（主站是 +86-xxx-xxxx-xxxx / info@demo-c.com），不能混用

## 完整时间线：v1 → v2 → v3（v2.3 陷阱 → v2.4 诞生）

### 2026-04-17 上午：v1.0 MVP 手搓
- 严重违反 v2.3 满配流程 — 没 fork starter、没跑完整技能链、只交付 115 页
- **客户反馈：非常满意，结构清晰**
- 智能体当时判定为"违规建站事件"

### 2026-04-17 下午：v2.0 按 v2.3 满配正规重建
- 按 v2.3 流程 fork starter + 跑完 9 技能 + 开满功能开关 + 3000 程序化 SEO
- 4441 页（38 倍差距）
- **客户反馈：乱、像草稿、像拼贴、不专业** ← 与 v1 完全相反
- 这个反差信号暴露了 v2.3 的"**模板复刻陷阱**"：智能体按 Pure Manufacturer 模板建，但 Demo-A 是 Solution Integrator

### 2026-04-17 深夜：智能体升级到 v2.4
本事件驱动建站智能体从 v2.3 升级到 v2.4：
- 新增"业务叙事建模"作为 build-startup 必做前置
- 7 种业务模型判定树（Pure Manufacturer / Solution Integrator / OEM-ODM / Brand Owner / Trader / Material Supplier / Service Provider）
- 蓝图降级为"参考菜单"（编译期阻止一行套完）
- 新增反模板复刻自检 5 问 + 去名称压力测试

### 2026-04-18：v3 按 v2.4 叙事档案重建
- 产出《业务叙事档案.md》（判定为 Solution Integrator + 提取 3 叙事单元）
- 策略：基于 v1 MVP 现代化（客户已认可的结构）+ 补 DNA（FAQPage Schema / llms.txt）
- 115 页 / 6 语种 / Solution Integrator 三件套
- **已部署上线 https://demo-a.com** — 等客户二次反馈验证

## 备份与归档

- `website-v1-mvp/` — v1 手搓版（客户满意源，永久保留作对照）
- `website-v2-archive/` — v2 满配版（反面活化石，永久保留）
- `website/` — **当前生产版 v3**（v2.4 方法论首个实例）

## v2.0 交付物清单

- 5 层 Schema 全齐：Organization + Product + Article + FAQPage + BreadcrumbList
- 3200+ 程序化 SEO 页（国家×产品 + 行业×场景 + 问题 4 子类）
- ROI 计算器（冷链投资回报计算）
- 选型向导（wizardTags 驱动）
- 6 语种完整覆盖（含 AR RTL）
- Web3Forms Key `YOUR_WEB3FORMS_KEY`（客户提供）
- IndexNow Key `YOUR_INDEXNOW_KEY`（运营人员代生成）
- IndexNow 3643 URLs 全量提交 Bing/Yandex

## 部署优化

`tar + scp` 从 3 小时缩短到 3 分钟 — **所有多文件大站部署都应用此方案**。

## 五维度评分

**46/50（92%）**，略高于客户D Demo-B。

## 四份交付文档

- 阶段验收报告
- 上线检查报告
- 网站交付说明书
- 上线后第一周检查清单

## 当前状态

🟢 可交付 · 已上线 · 等客户：

- [ ] 浏览器测试 Web3Forms 表单
- [ ] 注册 GA4 property
- [ ] 注册 Google Search Console
- [ ] 补齐真实产品素材
- [ ] 确认最终部署目标（若要迁移域名）

## 可复用到其他客户的沉淀

1. **6 语种 Astro `[locale]` 动态路由 + getStaticPaths** — 同类俄语/拉美/中东目标市场客户可直接复用
2. **Solution Integrator 三件套**（Who-We-Serve + Factory-Network + Solutions/[type]）— 所有方案整合商客户必走，详见 [业务模型库/Solution-Integrator.md](../../经验库/业务模型库/Solution-Integrator.md)
3. **大站部署 tar+scp 方案** — 所有 1000 页以上站点的标准部署法
4. **独立联系方式 + 独立 git 仓库** — 同一客户多站并行的必要隔离
5. **v1→v2→v3 三版对照教训** — **模板复刻陷阱**：v2.3 满配 ≠ 客户价值；业务叙事先行比模板齐全更重要。详见 [通用教训/模板复刻陷阱.md](../../经验库/通用教训/模板复刻陷阱.md)
6. **基于 v1 MVP 现代化策略** — 当客户已有满意版本，在其上补 DNA 层比从零重建更稳妥
