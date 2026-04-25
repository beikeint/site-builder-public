# 🔧 网站上线后·运维 SOP

> 客户站上线后，下面这些事每天/每周/每月需要跑。
> v9.2 运营SOP的精简汇总版，完整细节看主站 demo-c.com 的 daily-cron.mjs。

---

## 每日自动巡检（pm2 cron 8:00 自动跑）

**7+1 项**：
1. HTTPS 状态 (200)
2. 首屏响应时间 (<1.5s)
3. SSL 证书剩余天数 (>30天)
4. SEO元素检查（title/desc/H1）
5. Sitemap 可访问
6. AI 爬虫 robots.txt 正常
7. GSC 爬取错误 = 0
8. 每日增长（周一到周六各有主题：SEO精细化 / 内容深度 / 内链架构 / GEO强化 / CRO优化 / SERP特征抢占）

**结果推送**：企业微信机器人

---

## 每周一：GSC + GA4 数据分析

**做的事**：
- GSC 7天展示/点击/CTR/平均排名 → 对比上周变化
- GA4 7天会话/用户/浏览/转化事件
- 筛出"高展示低CTR"页面→优化 Title/Meta（周五执行）
- 筛出"有展示无点击"关键词→做答案胶囊或FAQ

**脚本工具**：search-analytics MCP (`gsc_search_performance`, `ga4_traffic_summary`, `gsc_ranking_changes`)

**过滤假数据铁律**：
- 必须过滤带 `-site:` 的假关键词（记忆文件 feedback_gsc_reporting.md）
- 禁止夸大排名，统一标注"平均排名"

---

## 每周运营节奏（按周计划）

| 星期 | 主题 | 典型动作 |
|---|---|---|
| 一 | SEO 精细化 | 重写高展示低CTR页面的 Title+Desc，加数据/价格/ROI卡点 |
| 二 | 内容深度进化 | 扩充某篇博客/产品页的规格+FAQ+定价表 |
| 三 | 内链架构优化 | 找"入站0条"的页面，给它加3-5条入站内链 |
| 四 | GEO 强化 | 给高排名页面加答案胶囊（60词直接回答）+ PAA |
| 五 | CRO 优化 | 加中间CTA蓝色卡片，优化询盘漏斗 |
| 六 | SERP 特征抢占 | 加 Featured Snippet + FAQ Schema |
| 日 | 休息/应急 | 客户紧急需求/周度复盘 |

---

## 每月：GSC 索引健康度检查

**目标指标**：
- 索引率 ≥90%（抽样10页→已索引≥9）
- 无抓取错误
- 核心关键词 TOP10 保持

**异常处理**：
- 页面"Crawled but not indexed"→手动提交IndexNow+GSC重新提交
- 页面"Discovered not crawled"→检查Sitemap是否有它，加入站内链
- 关键词大幅下滑→检查是否Schema/Title变更导致

---

## 紧急情况 runbook

### 🚨 站点down (HTTP != 200)
1. `curl -I https://{domain}/` 确认
2. SSH 服务器看日志：`ls -la ~/domains/{domain}/public_html/`
3. 如是部署失败的残留→重新 `scp -r dist/* 服务器:`
4. 如是服务器挂→联系 Hostinger 支持

### 🚨 表单提交失败
1. 检查 site.config.ts 里的 `web3FormsAccessKey` 不是 `WEB3FORMS-PLACEHOLDER`
2. 在浏览器 DevTools 查看请求响应
3. 登录 web3forms.com 查看消息历史

### 🚨 SSL 证书快到期 (<7天)
Hostinger 一般自动续期，如果没续：
1. 登录 hPanel → SSL → Force renew
2. 或者联系支持

### 🚨 GA4 数据异常停止
1. 检查 site.config.ts 里的 `analytics.ga4` 不是 `G-PLACEHOLDER`
2. BaseLayout.astro 里有 gate 判断非占位符才注入脚本
3. GA4 Debug View 验证事件是否在传

### 🚨 搜索排名突然崩盘
1. 看 GSC 是否有 Manual Action（最严重）
2. 看是否近期有 Google core update
3. 看 title/schema 是否有 build bug 导致线上空白
4. 24-48h 没恢复就考虑回滚 git commit

---

## QA 必检 12 项（每次部署前跑）

客户建站 QA 清单，完整版见记忆 `feedback_website_qa_checklist.md`：

1. ✅ WhatsApp 区号正确（`+86` 不能丢）
2. ✅ 电话号全站一致（一个 site.config.ts 唯一源）
3. ✅ 无竞品水印/图片残留
4. ✅ mailto 和 tel 有兜底（手机端可点）
5. ✅ 统一来源（site.config.ts 而不是硬编码）
6. ✅ Schema 正确（Organization + Product/FAQ + Breadcrumb）
7. ✅ GA4 追踪事件绑定（data-gtm）
8. ✅ IndexNow key 已生效
9. ✅ **表单实际提交测试**（绝不能是占位符）
10. ✅ 导航项必有落地页（`features.xxx: true` 必须有对应 `/xxx/` 页，否则全局死链）
11. ✅ 产品详情页动态字段空值检测（`model/price/shelfLife` 空时禁止渲染空括号，用 helper 变量兜底）
12. ✅ 根 URL 跳转空壳含 verification meta（`curl -s https://<域名>/ | grep verification` 必须有；禁用 `Astro.redirect()`）

---

## 自我进化铁律

**同一错误不许出现第二次**（记忆 `feedback_self_evolution.md`）

修复错误后必须：
1. 找到根因（为什么会发生）
2. 更新规则到 QA 清单/CLAUDE.md/记忆
3. 下个客户建站主动避坑

**样例**：
- 主站 demo-c.com 曾硬编码电话号到32个文件，发现Web3Forms access key没替换占位符
- → 升级 QA 清单到9项（+表单实测）
- → 升级 site.config.ts 模式（集中管理）
- → demo-a 从Day1就用 site.config.ts，避免重蹈覆辙

---

## 相关文档

- [客户操作教程-通用模板.md](客户操作教程-通用模板.md)
- [已交付客户速查表.md](已交付客户速查表.md)
- [../CLAUDE.md](../CLAUDE.md) — 智能体技术定义
- 主站运营实战：`../../../客户/Demo-C-client-B/` (demo-c.com)
