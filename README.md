# QuietVault · GitHub Pages package

本包是基于原 QuietVault v3.1 文件与《QuietVault 新版需求整理稿》整理的 GitHub Pages 部署包。它继续使用现有 Supabase 项目，不包含任何 Supabase secret/service_role 密钥。

## 文件
- `index.html`：前端应用
- `manifest.webmanifest`：PWA 安装信息
- `sw.js`：应用外壳离线缓存（不代表云端资料已自动离线同步）
- `schema-v3.sql`：旧版 kind 约束迁移参考；**不要在未核对现有数据库约束前重复执行**
- `MIGRATION_NOTES.md`：兼容性与尚未实现功能说明

## GitHub Pages
仓库 Settings → Pages → Build and deployment：选择 Deploy from a branch；Branch 选择 `main`，目录选择 `/ (root)`，保存。等待部署完成后访问 `https://zhaojiale983-sudo.github.io/QuietVault/`。

## Supabase 配置
首次打开会要求 Project URL 与 Publishable/anon key。使用现有项目：
- Project URL: `https://bfnhgofoeoxwdmlamscq.supabase.co`
- Key: 从 Supabase Dashboard → Project Settings → API 中复制 `anon` 或 Publishable key。

不要把 `service_role` / secret key 填入网页。原有 `vault_items` 表、`private-vault` 私有 bucket、RLS 与账号均应保留。

## 重要限制
- Storage 实际单文件上限仍由现有 bucket、Supabase 套餐与项目配置决定；网页不承诺无限容量。
- PWA 缓存应用外壳，不会自动把全部云端附件下载到设备。
- Android 网页不能可靠枚举已安装浏览器；系统打开方式与 Chrome/Edge intent 仅在部分设备可用。
- 本包保留原有 API 客户端加密交互，但这不是端到端加密，也不替代 Supabase Auth/RLS。
- 旧版 ZIP/DOCX 处理能力有限，不能视为完整的 Tavern 世界书/PNG WebP 角色卡解析器。

详细边界见 `MIGRATION_NOTES.md`。
