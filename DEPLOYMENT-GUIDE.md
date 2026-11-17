# DR PROPERTY — Deploy Guide (1 Supabase + 2 GitHub repos + 2 Vercel projects)

Admin (dr-property-admin.zip) aur Website (dr-property-website.zip) dono ek hi Supabase database use karte hain.

## A. Supabase (sirf ek baar)
1. supabase.com → project kholein (jo aapne banaya hai).
2. SQL Editor me ye 3 files ORDER me run karein (har ek: New query → paste → Run):
   1) admin zip → `schema.sql`
   2) website zip → `public-access.sql`
   3) website zip → `seed-articles.sql`  (17 property articles + 9 FAQs; safe to rerun to add new guides)
3. Authentication → Users → Add user (apni email + password, Auto Confirm tick).
4. SQL: `update public.profiles set role='owner' where email='APNI_EMAIL';`
5. Authentication → Sign In / Providers → "Allow new users to sign up" band.
6. Project Settings → API Keys → **Publishable key** copy karein (secret key kabhi nahi).

## B. Dono config.js
Admin aur Website dono folders me `config.js` kholein:
`window.CFG={url:"https://qijbjpdxwkvwfpvkecqn.supabase.co",key:"sb_publishable_..."};`

## C. GitHub (2 repos)
1. github.com → New repository → name `dr-property-admin` → Private → Create.
2. "uploading an existing file" → zip EXTRACT karke folder ke ANDAR ki saari files/folders drag karein (zip nahi, folder ke andar ka content; index.html root par honi chahiye) → Commit changes.
3. Isi tarah dusri repo `dr-property-website` banayein aur website folder ka content upload karein.

## D. Vercel (2 projects)
1. vercel.com → GitHub se login → Add New → Project → `dr-property-admin` Import → Framework: Other → Deploy.
2. Dobara Add New → Project → `dr-property-website` Import → Deploy.
3. Website project → Settings → Environment Variables:
   `SUPABASE_URL` = https://qijbjpdxwkvwfpvkecqn.supabase.co
   `SUPABASE_ANON_KEY` = publishable key
   phir Deployments → Redeploy.

## E. Links jodna
1. Supabase → Authentication → URL Configuration: Site URL = admin Vercel link; Redirect URLs me website link bhi add.
2. Domain (optional): Vercel → Settings → Domains: website = drproperty.pk, admin = admin.drproperty.pk.
3. Admin → SEO page: canonical URL (website link) daal kar "Generate & save" dabayein → /sitemap.xml, /robots.txt, /llms.txt chalne lagengi.
4. Google Search Console me website add karke sitemap.xml submit karein.

## F. Roz ka kaam
Admin login → Properties/Projects/Blog add karein → website par foran dikhta hai (rebuild nahi). Counters: Admin → Counters (sirf asli numbers). Update code: GitHub me file replace → Vercel auto deploy.

## SEO update (website)
Website Vercel project me 3 env vars: SUPABASE_URL, SUPABASE_ANON_KEY, SITE_URL (apna live link). Detail: SEO-GUIDE.md.
