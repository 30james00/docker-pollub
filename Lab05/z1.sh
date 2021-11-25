# Create networks
docker network create -d bridge --subnet 10.0.10.0/24 bridge1
docker network create -d bridge --subnet 10.0.11.0/24 bridge2

# Run T1 container 
docker run -itd --name t1 alpine

# Run and connect to bridge1 T2 container
docker run -itd --name t2 -p 80:80 -p 10.0.10.0:8000:8000 nginx
docker network connect bridge1 t2

# Run D1 container connected to bridge1 network
docker run -itd --name d1 --net bridge1 --ip 10.0.10.254 alpine

# Run D2 container connected to bridge1 and bridge2 networks
docker run -itd --name d2 --net bridge1 -p 10.0.10.0:8080:8080 -p 10.0.11.0:8081:8081 httpd
docker network connect bridge2 d2

# Run S1 container connected to bridge2
docker run -itd --name s1 --net bridge2 ubuntu

# Run inspect on all networks
docker inspect bridge
docker inspect bridge1
docker inspect bridge2