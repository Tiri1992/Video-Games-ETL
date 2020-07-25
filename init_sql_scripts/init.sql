use VideoGamesDB;
-- Staging Table
create table if not exists source_data_staging (
	Name varchar(100),
	NameID int,
	Platform varchar(100),
	PlatformID int,
	Genre varchar(100),
	GenreID int,
	Publisher varchar(100),
	NA_Sales float,
	EU_Sales float,
	JP_Sales float,
	Other_Sales float,
	Global_Sales float
);

-- Ingest staging table
LOAD DATA LOCAL INFILE "/mysql-data/vgsales.csv"
INTO TABLE source_data_staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Name, Platform, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales);

-- dim Name
create table if not exists d_name (
	NameID int auto_increment primary key,
	Name varchar(100) unique
);

-- dim Platform: Platform, Publisher
create table if not exists d_platform (
	PlatformID int auto_increment primary key,
	Platform varchar(100) unique
);

-- dim Genre
create table if not exists d_genre (
	GenreID int auto_increment primary key,
	Genre varchar(100) unique
);

-- Fact Table `Measures`: NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales
create table if not exists f_sales (
	SalesID int auto_increment primary key,
	NameID int not null,
	PlatformID int not null,
	GenreID int not null,
	NA_Sales float,
	EU_Sales float,
	JP_Sales float,
	Other_Sales float,
	Global_Sales float,
	
	index `idx_name`(NameID),
	index `idx_platform`(PlatformID),
	index `genre_id`(GenreID),
	
	foreign key (NameID)
		references d_name(NameID)
		on update cascade on delete restrict,
		
	foreign key (PlatformID)
		references d_platform(PlatformID)
		on update cascade on delete restrict,
		
	foreign key (GenreID)
		references d_genre(GenreID)
		on update cascade on delete restrict
);	

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

-- POPULATE DIM GENRE
insert ignore into d_platform(
	Platform
)
select 
	distinct Platform
from source_data_staging
order by Platform asc;