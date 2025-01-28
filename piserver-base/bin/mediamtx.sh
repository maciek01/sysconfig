
docker restart mediamtx

#docker run --name mediamtx  --restart always  -d --rm --network=host bluenviron/mediamtx:latest
docker run --name mediamtx  --restart always  -d --network=host bluenviron/mediamtx:latest
