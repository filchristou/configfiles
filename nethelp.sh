#Finding ip address from host names
host swr.de
dig swr.de
nslookup swr.de

#Finding host name from ip address
host 217.66.32.25
nslookup 217.66.32.25

#Get default getaway
ip route | grep default

#check my hardware interfaces
sudo lshw -C network
