LOAD DATA LOCAL INFILE "/Users/sotirigeorgiou/Documents/Other/StarSchemaDesign/vgsales.csv"
INTO TABLE source_data_staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Name, Platform, Genre, Publisher, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales);
