docker network create -d bridge --subnet 10.0.10.0/24 bridge1

docker run -itd --name t1 alpine

docker run -itd --name t2 -p 80:80 -p 10.0.10.0:8000:8000 nginx
docker network connect bridge1 t2

docker run -itd --name d1 --net bridge1 --ip 10.0.10.254 alpine

docker inspect bridge1

docker stop t1 t2 d1
docker rm t1 t2 d1
docker network rm bridge1