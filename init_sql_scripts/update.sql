use VideoGamesDB;

-- UPDATE GenreID on source_data_staging
update source_data_staging, d_genre
set source_data_staging.GenreID = d_genre.GenreID
where source_data_staging.Genre = d_genre.Genre
and source_data_staging.GenreID is null;

-- UPDATE NameID on source_data_staging
update source_data_staging, d_name
set source_data_staging.NameID = d_name.NameID
where source_data_staging.Name = d_name.Name
and source_data_staging.NameID is null;

-- UPDATE PlatformID on source_data_staging
update source_data_staging, d_platform
set source_data_staging.PlatformID = d_platform.PlatformID
where source_data_staging.Platform = d_platform.Platform
and source_data_staging.PlatformID is null;