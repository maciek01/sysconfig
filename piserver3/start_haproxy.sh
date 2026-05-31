
docker run -d \
  --name haproxy \
  --restart always \
  -p 5000:5000 \
  -v /home/pi/haproxy:/usr/local/etc/haproxy:ro \
  haproxy
