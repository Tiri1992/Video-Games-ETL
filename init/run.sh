#!/bin/bash

# Run init
mysql -uroot -proot VideoGamesDB < "./init_sql_scripts/init.sql";
sleep 5;

# Run Update
mysql -uroot -proot VideoGamesDB < "./init_sql_scripts/update.sql";
sleep 5;
# Run Update Facts Table
mysql -uroot -proot VideoGamesDB < "./init_sql_scripts/update_fact.sql";