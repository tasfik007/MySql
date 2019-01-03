--Tasfik Rahman
-- source Instagram_Clone/instagram_queries.sql; 

--***[some important queries on the instagram DB...]

-- 1.Finding the 5 oldest users to reward... 
    select * from users order by created_at asc limit 5;

--2.What day of the week do  most users register...
    select dayname(created_at) as date, count(*) as total from users
    group by dayofweek(created_at)  having count(*)=(
    select count(*) from users
    group by dayofweek(created_at) order by count(*) desc limit 1
    );  

--3.Identify inactive users [who haven't posted any photos yet]...
    select username,users.created_at from users
    left join photos on users.id=photos.user_id 
    where photos.id is NULL;  
--Tasfik Rahman
--4. Who got the most likes on a single photo...
    select * from users join photos on
    users.id=photos.user_id where photos.id = (
    select photo_id from likes group by 1 order by count(*) desc limit 1
    );

--5.Finding the average user posts...
    select (
        (select count(*) from photos) /(select count(*) from users)
    ) as 'AVG posts';

--6.Finding the top 5 hash tags...
    select tag_name,count(*) as total from tags join
    photo_tags on tags.id=photo_tags.tag_id group by tags.id 
    order by total desc limit 5;
--Tasfik Rahman 
--7.Finding the bots...
    select concat('Bot ',username) as 'BOTS',user_id,count(*) as num_likes 
    from likes join users
    on likes.user_id=users.id
    group by likes.user_id 
    having num_likes = (
        select count(*) from likes 
        group by user_id 
        order by count(*) desc limit 1
        );
        
    
   