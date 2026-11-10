# NovaCréa — mise en place (≈ 15 min)

## 1. Créer la base (gratuit)
1. Créez un compte sur supabase.com puis un projet.
2. **SQL Editor** : collez `supabase.sql` (après avoir remplacé `VOTRE_EMAIL_ADMIN` par votre email, 2 fois) et cliquez Run.
3. **Authentication > Users > Add user** : créez-vous avec cet email + un mot de passe solide (cochez « Auto confirm »).
4. **Authentication > Providers > Email** : désactivez « Allow new users to sign up » pour que personne d'autre ne puisse créer de compte.

## 2. Relier le site
**Project Settings > API** : copiez *Project URL* et la clé *anon public*, puis collez-les dans `index.html` (bloc CONFIGURATION, avec votre email de contact). La clé anon est faite pour être publique : la sécurité vient des règles RLS du SQL.

## 3. Mettre en ligne
Déposez `index.html` sur Netlify, Vercel, Cloudflare Pages ou votre hébergeur (glisser-déposer suffit), puis connectez votre nom de domaine.

## 4. Consulter les briefs
Allez sur `https://votre-site/#admin`, connectez-vous : liste des briefs, statut modifiable (Nouveau, En cours, Devis envoyé…), export CSV. Vous pouvez aussi voir les données brutes dans Supabase > Table Editor.

## Bonus recommandé
- Notification email à chaque brief : Supabase > Database > Webhooks (ou Edge Function + Resend).
- Anti-spam : ajoutez Cloudflare Turnstile devant l'envoi.
- RGPD : ajoutez une page mentions légales / confidentialité.
