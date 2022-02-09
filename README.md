# SimbliPostgresSetup
Docker compose setup with create initial tables

To run the Postgres Database:
1) Clone this repo.
2) Run docker-compose up.
This will install posgres, create the database as perdefined in the docker-compose.yml and create the tables as defined in db/setup.sql.

To shutdown database alone:
Run docker-compose down

To Remove the volume along with shutdown (required for creating tables again on docker compose up):
Run docker-compose down -v db

