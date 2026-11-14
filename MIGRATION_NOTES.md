# QuietVault v4 package · implementation and compatibility notes

## 已整理进本包
- 保留原 Supabase Auth、`vault_items` 数据读取和 `private-vault` 私有 Storage 访问方式。
- 保留笔记、网址、API、世界书、文件、图片、字体、小手机、人设卡的既有基础类型。
- 保留奶油黄手账视觉、原图标、移动端布局、登录/注册与退出入口。
- 首页增加独立「＋添加收藏」入口；手动创建与文件导入入口分开。
- 移除前端写死的 50 MB 文件拦截，实际仍受 Supabase 当前 Storage 限制。
- 增加 Service Worker 应用外壳缓存与 PWA manifest。

## 需要保留并核对的现有后端条件
- Supabase project: `bfnhgofoeoxwdmlamscq`
- Table: `public.vault_items`
- Private bucket: `private-vault`
- 现有用户、记录、对象、RLS policies 不应删除或重建。
- 不能仅凭前端推断当前数据库所有列、约束和 Storage policy；上线前需在 Dashboard 核对。

## 尚未完整实现（不能把需求清单误当成已交付功能）
以下需求在原 v3.1 前端中不存在完整闭环，本包未虚称已经实现：
- 完整世界书结构化解析/条目树编辑/重排/多分类与版本历史。
- Tavern/PNG/WebP 多格式角色卡解析、角色卡字段编辑和多世界书关联。
- ZIP 保留完整目录层级、可靠批量导入、逐文件独立 DOCX 转换及错误隔离的完整流程。
- 统一文件管理器、多选批量操作、任意文件格式完整预览、断点续传。
- API/资料通用版本快照、差异比较、冲突解决。
- 真正的 30 天回收站、云端每周自动备份、全量 ZIP/JSON 备份与安全恢复。
- IndexedDB 离线编辑队列、自动同步、冲突提示、离线上传暂存。
- 跨设备主题同步、PIN/生物识别锁。
- 小手机原生应用图标自动获取及全部 Android 浏览器精确指定。

这些功能需要数据库迁移、存储策略或额外前端/后端模块，不能安全地通过只替换 `index.html` 假装完成。

## SQL
`schema-v3.sql` 是旧 v3 的 kind constraint 迁移脚本，不是完整 v4 schema。不要盲目执行。先核对当前 `vault_items_kind_check` 是否存在及其实际定义；不要 drop/recreate 表，不要改动 RLS 或 Storage policy。

## 测试清单
1. 先确认 GitHub Pages 部署成功。
2. 用现有账号登录，确认旧记录仍可见。
3. 测试新建笔记、网址和一条小文件上传/下载。
4. 确认退出后重新登录仍可读取。
5. 若出现登录循环、RLS 或 Storage 错误，保留错误文本，不要清空浏览器数据或 Supabase 数据。
