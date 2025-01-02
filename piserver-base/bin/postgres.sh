
docker restart pi-postgres
#docker pull postgres

docker run --name pi-postgres --restart always -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=pi -d -p 5432:5432 postgres


