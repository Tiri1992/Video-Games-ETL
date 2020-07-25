-- Populate Fact Table Last:
insert ignore into f_sales (
	NameID,
	PlatformID,
	GenreID,
	NA_Sales,
	EU_Sales,
	JP_Sales,
	Other_Sales,
	Global_Sales
)
select
	NameID,
	PlatformID,
	GenreID,
	NA_Sales,
	EU_Sales,
	JP_Sales,
	Other_Sales,
	Global_Sales
from source_data_staging;