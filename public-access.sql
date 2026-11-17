-- Run ONCE in Supabase SQL Editor: lets the PUBLIC website read published content + send inquiries.
-- Dashboard (owner) policies stay untouched.
do $$ declare r record; begin
for r in select * from (values
 ('properties',$q$status in ('published','sold','rented')$q$),
 ('projects','published=true'),
 ('testimonials','published=true and coalesce(is_demo,false)=false'),
 ('team_members','visible=true'),('agents','visible=true'),('faqs','visible=true'),
 ('blog_posts',$q$status='published'$q$),('homepage_sections','visible=true'),('site_settings','true')
) v(t,c) loop
 execute format('drop policy if exists pub_read on public.%I',r.t);
 execute format('create policy pub_read on public.%I for select to anon,authenticated using (%s)',r.t,r.c);
end loop; end$$;

drop policy if exists pub_inquiry on public.inquiries;
create policy pub_inquiry on public.inquiries for insert to anon,authenticated
 with check (status='new' and coalesce(is_demo,false)=false and length(name) between 2 and 120 and coalesce(length(message),0)<=2000);

-- Public image/video URLs (files are unguessable UUID names). Admin keeps write access via owner_storage.
update storage.buckets set public=true where id in ('property-images','project-images','team-images','agent-images','blog-images','property-videos','website-assets');
