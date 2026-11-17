# DR PROPERTY — Public Website (Phase 2)
Same Supabase project as the admin dashboard. No second database.

## Setup (5 steps)
1. Supabase → SQL Editor → run `public-access.sql` once (public read of published content, inquiry insert, public image URLs).
2. `config.js` → paste your Project URL and **Publishable key** (never the secret key).
3. Test locally: `npx serve -s .` (or just open index.html; file mode uses #/ routes).
4. Push to GitHub → import in Vercel. Add env vars `SUPABASE_URL` and `SUPABASE_ANON_KEY` (for /sitemap.xml, /robots.txt, /llms.txt).
5. In Admin → SEO set your canonical URL and press "Generate & save".

## How content flows
Admin adds/edits → Supabase → website reads live (no rebuild). Featured property → Spotlight carousel. Published testimonials only (demo reviews never shown). Homepage "hero" section heading/subheading come from Admin → Homepage.

## Videos
`assets/hero.mp4` (hero, loops continuously, muted, mobile-safe) and `assets/about.mp4` (About Us centre box). Replace files with same names to change.

## Known limits
Plain HTML/JS (no Next.js SSR): pages render in the browser, so SEO is weaker than a server-rendered site. Rate limiting is browser-side + a honeypot; add a Supabase Edge Function for strong server-side limits.
