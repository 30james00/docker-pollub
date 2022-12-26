# Simpleweb
Sample Dockerfile using SSH to build node app from Github repository. 

Building image: `docker build --ssh default -t lab2.v1 .`  
Building image(Buildx not installed): `BUILDKIT_ENABLE=1 docker build --ssh default -t lab2.v1 .`  
Run: `docker run -l test -p 8080:8080 lab2.v1`