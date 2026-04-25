# 客户B · demo-c.com(EPS/EPP 工厂直营)

> 2026 早期上线 · 客户B 主站 · v2.4 升级前的早期 starter 直接 fork 产物
> **2026-04-25 i18n 攻坚** — 暴露并修复了 cp-多目录翻译反模式,触发智能体新增 [i18n-翻译彻底.md](../../经验库/通用教训/i18n-翻译彻底.md) 通用教训
> 与并行案例 [客户B-demo-a.md](客户B-demo-a.md) 同源(都是 client-B 旗下),技术栈共享但定位不同

## 基本信息

- **客户ID**:client-B(client-manager,与 demo-a 共用 ID 但分两个项目目录)
- **项目目录**:`${WORKSPACE_ROOT}/客户/Demo-C-client-B/`(独立 git)
- **定位**:Pure Manufacturer(纯工厂直营,与 demo-a 的 Solution Integrator 形成对比)
- **语种**:6 语 — EN(默认)/ ES / PT / FR / RU / AR
- **目标市场**:拉美(ES/PT 主)+ 俄语区 + 中东 + 法语区
- **页数**:410 页(build dist),sitemap 398 URLs
- **联系方式**:`+86 138 6163 9770` / `info@demo-c.com`(独立于 demo-a 的 +86-xxx-xxxx-xxxx / info@demo-a.com)

## 业务叙事(已建)

- 工厂自营,自有 10000+ m² 制造基地 + 3 分支(Jiangyin / Wenzhou / Dongguan)
- 1999 年成立,500+ 条 turnkey 生产线交付,60+ 国家
- 核心 USP:CE & ISO 9001 + 5 年质保 + 90 天交付 + 比欧洲价低 30%
- DNA(v2.3 遗产):5 种 Schema 全齐 / 12 GA4 事件 / GEO 答案胶囊 / 多触点询盘漏斗

## 2026-04-25 i18n 攻坚事件 ⚡

### 触发数据

GSC 过去 28 天:
- fr 27 曝光 / ar 31 曝光 / ru 35 曝光 / pt 18 曝光
- **4 语种 CTR 全部 0%**(SERP 流量进来后秒退)

### 根因

建站期 starter 默认布局是 cp-多目录反模式(`pages/{en,es,pt,fr,ru,ar}/page.astro`),建站者 cp es/* fr/ 后**只改了 hero 几行**,其余 95% 内容仍是 ES。叠加:

1. `Header.astro` import 了 t() 但 nav 11 标签全硬编码英文 → 6 语种共用英文 nav
2. `page-content.ts` fr/ru/ar 直接 `(content as any).fr = content.en` fallback → fr/ru/ar 用户看到英文内容
3. `astro.config.mjs i18n.locales` 只配 EN/ES/PT,漏 FR/RU/AR
4. `ExitIntent.astro` 无 locale prop,硬编码英文 → 全语种弹窗都英文

### 攻坚方案(3 阶段 8 commits)

| 阶段 | 内容 | 工作量 | commit |
|---|---|---|---|
| Stage 1 | Header.astro 切 t(),53 处文本本地化 | 2-3h | `0b95693` |
| Stage 2 PoC | quality 单页迁 [locale] 验证 routing | 4-6h | `c1b31df` |
| Stage 3 Batch 1-6 | 11 类页面全迁 [locale] + ExitIntent locale-aware | 14-18h | 5 个 batch commit |

### 翻译数据规模

`page-content.ts` 从 ~600 行膨胀到 ~3000 行,新增 **8 个 content blob × 6 语种 ≈ 1500-2000 段真翻译**:

- privacyContent / applicationsContent / contactContent / solutionsContent + solutionsModel
- blogContent / productListContent / productDetailContent / homeContent / exitIntentContent
- aboutContent + thankYouContent fr/ru/ar 补真翻译(此前 fallback)
- 仅 faqContent 8 Q&A 在 fr/ru/ar 仍 fallback,留作 polish

### 验证结果

- ✅ build 410 页 + sitemap 398 URL 全过
- ✅ GSC URL pattern 完全不变(`[locale]/quality/` 与原 `quality/` 同 URL),无需 301 重定向
- ✅ 6 语种线上 curl 抽检全部本地化:fr "Lancez Votre Usine EPS" / ru "Запустите свой завод" / ar "ابدأ مصنع EPS الخاص بك"
- ⏱️ 14 天后(2026-05-09)复查 GSC CTR 是否从 0% 上升

### 教训沉淀

完整 8 条硬规则见 [经验库/通用教训/i18n-翻译彻底.md](../../经验库/通用教训/i18n-翻译彻底.md):
1. 多语言建站从第一文件就用 [locale] 动态路由
2. astro.config.mjs i18n.locales 必须列全
3. fallback 到 en 是隐性技术债,上线前必填真翻译
4. starter Header 必 grep 验证 t() 真用上
5. [locale] 迁移是 GSC 安全操作
6. 分阶段 ship(止血 / PoC / 全量)
7. client script 通过 data-* 属性传 i18n
8. 翻译表新增字符串必标记溯源

## 时间线索引

详细时间线见 client-manager `client-B`(timeline 累计 N 条),关键节点:
- 2026-04-23/24 web-ops 审计发现 fr/ar/ru/pt CTR 0% + Header 共用英文 + 实体污染等 P0
- 2026-04-25 上午 web-ops 修 P0(BaseLayout sameAs / Footer YouTube / llms.txt 电话 / 4 语种 hero 段)
- 2026-04-25 下午 建站智能体接手 i18n 攻坚 → Stage 1+2+3 全 ship 上线

## 与 demo-a (002u) 的对比

| 维度 | demo-c (本案) | demo-a (002u) |
|---|---|---|
| 业务模型 | Pure Manufacturer | Solution Integrator |
| 工厂叙事 | "our factory 10000m²" | "manufacturing network 5 partners" |
| 路由模式 | 旧 cp-多目录 → **2026-04-25 改为 [locale]** | 一开始就是 [locale] |
| starter fork 时间 | 早期版本(无 [locale] 默认) | v2.4 后版本 |

**关键启示**:同一智能体的两个客户因 starter fork 时间不同,前者陷反模式,后者天然合规。这证明 starter 模板的进化对避免新项目踩坑至关重要 — **starter 改动一次,所有未来客户受益**。
