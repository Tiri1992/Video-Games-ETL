# Video Games - ETL

Data Source: https://www.kaggle.com/gregorut/videogamesales

This is a simple ETL pipeline to ingest a flat file into a star schema design. Three dimensions tables are d_name, d_genre and d_platform. The fact table is f_sales.

### SCHEMA DESIGN:

![VideoGamesSchema](https://user-images.githubusercontent.com/44702437/88456906-de0d4e00-ce79-11ea-943c-1ae9988a8343.png)

## Description
The run.sh bash script is located inside ./init directory and this executes the sql scripts found in ./init_sql_scripts in the correct order. 

The container has mounted 3 volumes to the host: 
[Host: Container]
- ./mysql-data:/mysql-data/
- ./init_sql_scripts:/init_sql_scripts/
- ./mysql.cnf:/etc/mysql/mysql.cnf
- ./init:/docker-entrypoint-initdb.d/

The directory ./mysql-data contains the flat file csv which is loaded into the staging table before ETL. The reasoning behind creating a new file location in the mysql container was due to the init scripts found ./docker-entrypoint-initdb.d/ will only be executed if the data directory found in ./var/lib/mysql was empty so needed a potential work around. The mysql.cnf reflects these changes (more info https://hub.docker.com/_/mysql).

#

## How to run
You will need to have docker installed. Then run the following:

```sh
# cd into root directory

$ docker-compose -f ./docker-compose-mysql.yml up -d
```

The initialisation of the database plus the ETL scripts may take a few minutes. To check execution process:

```sh
# Get the container id by running

$ docker ps


# Then inspect the logs:

$ docker logs <CONTAINER_ID>
```
#

## Load Adminer

Go to your browser and type localhost:8080

<img width="545" alt="Screenshot 2020-07-25 at 13 45 53" src="https://user-images.githubusercontent.com/44702437/88457328-5cb7ba80-ce7d-11ea-8580-a1786b64ef6e.png">

Login with the above credentials. You will then be presented with the following page:

<img width="994" alt="Screenshot 2020-07-25 at 13 46 18" src="https://user-images.githubusercontent.com/44702437/88457381-c89a2300-ce7d-11ea-9b2c-f4db30d47100.png">

Inspecting the fact table we see all the data had been processed correctly.

<img width="973" alt="Screenshot 2020-07-25 at 13 46 39" src="https://user-images.githubusercontent.com/44702437/88457397-e6678800-ce7d-11ea-8b04-29375b9782b0.png">

#

### Stop Containers

To stop the container and decouple the volumes:

```sh
# Make sure you are in the dir with docker-compose-mysql

$ docker-compose -f ./docker-compose-mysql.yml down -v
```

Feel free to get in touch if there are any issues.


