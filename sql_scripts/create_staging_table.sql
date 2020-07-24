create table if not exists source_data_staging (
	SourceID int auto_increment primary key,
	Name varchar(50),
	NameID int,
	Platform varchar(50),
	PlatformID int,
	Genre varchar(50),
	GenreID int,
	Publisher varchar(50),
	NA_Sales float,
	EU_Sales float,
	JP_Sales float,
	Other_Sales float,
	Global_Sales float
) ENGINE=INNODB;
