
sudo ifconfig enp0s29u1u1u2 192.168.3.1

echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward > /dev/null
sudo iptables -P FORWARD ACCEPT
sudo iptables -A POSTROUTING -t nat -j MASQUERADE -s 192.168.3.0/24
