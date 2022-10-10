My practice to setup docker in my linux server
1) Containers are built by {container directory}/build.sh
2) Each container directory has some files:
  - ./build.sh
  - ./Dockerfile
  - ./build.sh - scripts run within container to perform build and configuration 
  - ./start.sh - Container start scripts
  - other folders and files - those are copied to docker container and use to create the container.
