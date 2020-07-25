-- dim Name
create table if not exists d_name (
	NameID int auto_increment primary key,
	Name varchar(50) unique
);

-- dim Platform: Platform, Publisher
create table if not exists d_platform (
	PlatformID int auto_increment primary key,
	Platform varchar(50) unique,
	Publisher varchar(50) unique
);

-- dim Genre
create table if not exists d_genre (
	GenreID int auto_increment primary key,
	Genre varchar(50) unique
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