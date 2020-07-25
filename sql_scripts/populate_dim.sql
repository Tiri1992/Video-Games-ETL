-- POPULATE DIM Genre:
insert ignore into d_genre(
	Genre	
)
select 
	distinct Genre
from source_data_staging
order by Genre asc;

-- POPULATE DIM Name:
insert ignore into d_name(
	Name	
)
select 
	distinct Name
from source_data_staging
order by Name asc;

-- POPULATE DIM PLATFORM
insert ignore into d_platform(
	Platform,
	Publisher
)
select 
	distinct Platform,
	Publisher
from source_data_staging
order by Platform asc, Publisher asc;
