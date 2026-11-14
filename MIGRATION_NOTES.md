# Migration notes

No SQL migration is included or run. Keep the existing Supabase project, auth users, tables, RLS policies and Storage objects. Verify the existing `vault_items` columns and private `private-vault` bucket before deployment. This frontend expects the `kind` values `phone`, `api`, `worldbook`, `persona`, and `font` to be accepted by the existing check constraint. Do not run the older v3 SQL blindly; it drops and recreates the kind check constraint.
