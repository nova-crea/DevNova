-- À coller dans Supabase > SQL Editor > Run
create table public.briefs (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  statut text not null default 'Nouveau',
  nom text not null check (char_length(nom) between 1 and 200),
  email text not null check (char_length(email) between 3 and 254),
  type text,
  budget text,
  donnees jsonb not null
);

alter table public.briefs enable row level security;

-- Les visiteurs peuvent UNIQUEMENT envoyer un brief (jamais lire ni modifier)
create policy "visiteurs envoient" on public.briefs
  for insert to anon with check (statut = 'Nouveau');

-- Seul l'admin connecté lit et met à jour. REMPLACEZ l'email :
create policy "admin lit" on public.briefs
  for select to authenticated using (auth.jwt() ->> 'email' = 'VOTRE_EMAIL_ADMIN');
create policy "admin modifie" on public.briefs
  for update to authenticated using (auth.jwt() ->> 'email' = 'VOTRE_EMAIL_ADMIN');
