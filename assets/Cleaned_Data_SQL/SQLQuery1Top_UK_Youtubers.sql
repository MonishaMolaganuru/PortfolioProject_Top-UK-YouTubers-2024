use youtube_db


/* 

Extracting channel Names from first column

*/

select CHARINDEX('@', NOMBRE) from top_uk_youtubers

create view view_top_uk_youtubers as

select 
     cast(substring(NOMBRE, 1, CHARINDEX('@', NOMBRE)-1) as varchar(100)) as channel_name, 
	 total_subscribers, 
	 total_views, 
	 total_videos 
from 
     top_uk_youtubers;

select * from view_top_uk_youtubers;

/* 

Data Quality Test

*/

-- 1. rows count

select count(*) as no_of_rows from view_top_uk_youtubers;



-- 2. column count

select 
     count(*) as no_of_column
from 
     INFORMATION_SCHEMA.COLUMNS
where	 
	 table_name = 'view_top_uk_youtubers';



-- 3. DataType check

select 
     COLUMN_NAME,
	 DATA_TYPE
from 
     INFORMATION_SCHEMA.COLUMNS
where	 
	 table_name = 'view_top_uk_youtubers';



-- 4. Duplicate check

select 
     channel_name,
	 	count(*) as duplicate_count
from 
     view_top_uk_youtubers
group by channel_name
having count(*) > 1











