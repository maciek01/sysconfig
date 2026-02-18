
docker run -d \
  --name haproxy \
  -p 5000:5000 \
  -v /home/pi/haproxy:/usr/local/etc/haproxy:ro \
  haproxy
