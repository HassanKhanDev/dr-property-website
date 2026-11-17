# DR PROPERTY — SEO Guide (kya ho chuka, aur traffic ke liye kya karna hai)

## Website me ho chuka (technical SEO)
- Build-time prerender: Vercel har deploy par properties, projects, blog, services, landing pages ka static HTML banata hai (Google ko asli text, title, canonical, Open Graph aur JSON-LD milta hai).
- 6 keyword landing pages: plots/houses for sale in Lahore, property for rent in Lahore, commercial property in Lahore, apartments & flats, DHA Lahore property.
- Schema: RealEstateAgent (local business, address Lahore/PK), RealEstateListing, BlogPosting, FAQPage, BreadcrumbList, WebSite.
- sitemap.xml, robots.txt, llms.txt har build par khud bante hain. Demo/sample listings index nahi hoti.
- 17 property guides + related articles + internal links (footer, blog, services, landing pages).

## Vercel settings (zaroori)
Website project → Settings → Environment Variables:
`SUPABASE_URL`, `SUPABASE_ANON_KEY` (publishable key), `SITE_URL` (jaise https://drproperty.pk, bina / ke).
Phir Redeploy. Build command vercel.json me already hai.

## Naya content jaldi index karwana
Admin se property/blog add karne ke baad website foran dikhti hai, lekin Google ke liye prerendered page naye build par banta hai:
1. Vercel → Settings → Git → Deploy Hooks → hook banayein, URL copy karein.
2. cron-job.org (free) par us URL ko roz ek baar (ya har 6 ghante) POST/GET karwayein. Ya naya content add karke Vercel me Redeploy dabayein.

## Traffic ke liye aapko ye karna hai (ye code se nahi hota)
1. Google Search Console: Domain add → verify → Sitemaps me `sitemap.xml` submit → URL Inspection se home + 5 top pages "Request indexing".
2. Google Business Profile (sab se bada local boost): "DR PROPERTY" real estate agency, address 143-G Phase 1 DHA Lahore, phone, hours, photos, website link. Customers se asli reviews maangein.
3. NAP same rakhein: Name, Address, Phone har jagah (website, Facebook, Instagram, Google) bilkul ek jaisa.
4. Asli listings dalein: har property me 6+ photos, saaf title (e.g. "10 Marla House for Sale in DHA Phase 6"), poori description, price, area. Landing pages tabhi rank karte hain jab un me asli listings hon.
5. Content: hafte me 1-2 article (Admin → Blog). Title me target keyword, 600+ words, 1 image, FAQ.
6. Backlinks: Facebook page, Instagram, YouTube (property tours), Pakistani business directories, local blogs. Social posts me website link.
7. Speed: images 150KB se chhoti, videos chhoti rakhein.
8. 2-3 mahine sabr: naye domain ko rank hone me waqt lagta hai. Search Console → Performance me queries dekh kar content banayein.

Koi bhi tool Google ranking ya traffic ki guarantee nahi de sakta.
