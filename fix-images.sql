-- Run in Supabase SQL Editor if dashboard images/videos do not show on the website.
insert into storage.buckets(id,name,public) values
 ('property-images','property-images',true),('project-images','project-images',true),
 ('team-images','team-images',true),('agent-images','agent-images',true),
 ('blog-images','blog-images',true),('property-videos','property-videos',true),('website-assets','website-assets',true)
on conflict (id) do update set public=true;
drop policy if exists pub_read_media on storage.objects;
create policy pub_read_media on storage.objects for select to anon,authenticated
 using (bucket_id in ('property-images','project-images','team-images','agent-images','blog-images','property-videos','website-assets'));
select id, public from storage.buckets order by id;  -- every row must show public = true
