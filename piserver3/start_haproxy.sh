
docker run -d \
  --name haproxy \
  --restart unless-stopped \
  -p 5000:5000 \
  -p 6000:6000 \
  -v /home/pi/haproxy:/usr/local/etc/haproxy:ro \
  haproxy
