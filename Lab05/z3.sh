# Create networks
docker network create -d bridge --subnet 10.0.10.0/24 bridge1
# docker network create -d bridge bridge2

# Run T1 container 
docker run -itd --name t1 alpine

# Run and connect to bridge1 T2 container
docker run -itd --name t2 -p 80:80 -p 10.0.10.0:8000:8000 nginx
docker network connect bridge1 t2

# Run D1 container connected to bridge1 network
docker run -itd --name d1 --network-alias host1 --net bridge1 --ip 10.0.10.254 alpine

# Run D2 container connected to bridge1 and bridge2 networks
# docker run -itd --name d2 --alias apa1 --net bridge1
# docker network connect --alias apa2 bridge2 d2

# Run inspect on all networks
docker inspect bridge
docker inspect bridge1
# docker inspect bridge2

# Clean up
docker stop t1 t2 d1
docker rm t1 t2 d1
docker network rm bridge1 #bridge2

# Kontenery przyłączone do dwóch różnych sieci NIE mogą się komunikować za pomocą aliasów, gdyż ich zasięg jest ograniczony do danej sieci