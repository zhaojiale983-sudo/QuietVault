# QuietVault（全新前端初版）

## 部署
1. 将本目录文件上传到 GitHub Pages 仓库根目录。
2. 在网页登录界面填写你**原有** Supabase 项目的 Project URL 和 Publishable/anon key。
3. 登录原有账号。不要使用 service_role key。

## 数据兼容
前端使用现有 `public.vault_items` 表与 `private-vault` 私有 Storage bucket，依赖字段：`id,user_id,title,kind,content,category,tags,metadata,object_path,updated_at`。RLS 必须限制用户只能访问自己的记录。不会自动执行 SQL，不会删除数据库内容。

## 重要限制（当前初版）
- 此包是全新前端骨架，已实现基础认证接入、条目 CRUD、分类字段、搜索、收藏、API/小手机表单、私有文件上传、字体预览与当前页面应用、JSON 导出、PWA 壳。
- 复杂世界书/角色卡格式解析、DOCX/ZIP 批量导入、完整版本历史、软删除回收站、自动云备份、可靠后台定时备份、IndexedDB 离线编辑与冲突合并、WebAuthn 生物识别、完整主题编辑器尚未实现，不能视为已交付。
- 浏览器启动选择仅对 Android Chrome/Edge 尝试 intent；其他浏览器选项会回退系统默认打开方式。
- 字体应用仅作用于当前 QuietVault 网页会话，不能修改 Android 系统或其他 App 字体。
- 私有 Storage 下载需现有 bucket 和用户策略允许。不要公开 bucket。
