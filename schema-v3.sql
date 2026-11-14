-- QuietVault v3 migration: enable phone and persona item types.
-- Safe to rerun; does not delete records, tables, storage objects, or RLS policies.
alter table public.vault_items
  drop constraint if exists vault_items_kind_check;

alter table public.vault_items
  add constraint vault_items_kind_check
  check (kind in ('note','link','api','worldbook','file','image','font','phone','persona'));

-- Existing category, folder, tags and metadata columns are reused.
