#Finding ip address from host names
host swr.de
dig swr.de
nslookup swr.de

#Finding host name from ip address
host 217.66.32.25
nslookup 217.66.32.25
#ask a specific DNS serber (e.g. Google 8.8.8.8)
nslookup 217.66.32.25 8.8.8.8

#Get default getaway
ip route | grep default

#check my hardware interfaces
sudo lshw -C network
sudo ip netns exec per_process_namespace ip address show
sudo ip -all netns exec ip link show

#show arp table
arp -a

#tcpdump on standard output and a file
#binary
tcpdump -i wlo1 -U -w - | tee test.pcap | tcpdump -r -

#restart radio wifi 
nmcli radio wifi off
nmcli radio wifi on

#DNS server
cat /etc/resolv.conf

#iptables
#show nat table
sudo iptables -t nat -S

#network namespace
#run a binary under a network namespace with the following command
sudo ip netns exec <namespace_name> binaryapplication
