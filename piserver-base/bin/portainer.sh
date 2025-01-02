
docker restart pi-portainer

docker run --name pi-portainer --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v /opt/portainer:/data portainer/portainer




