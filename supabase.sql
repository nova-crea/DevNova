create table public.briefs (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  status text not null default 'Nouveau',
  nom text not null check (char_length(nom) between 1 and 200),
  email text not null check (char_length(email) between 3 and 254),
  telephone text,
  budget text,
  donnees jsonb not null
);

alter table public.briefs enable row level security;

-- Les visiteurs peuvent UNIQUEMENT envoyer un brief (jamais lire ni modifier)
create policy "visiteurs envoient"
  on public.briefs
  for insert
  to anon
  with check (status = 'Nouveau');