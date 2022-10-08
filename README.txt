My practice to setup docker in my linux server
1) Containers are build by {container directory}/build.sh
2) Each container directory has some files:
  a) ./build.sh
  b) ./Dockerfile
  c) ./build - Build directory containing build files that are copied to docker container and use to create the container.
  d) ./build/build.sh - scripts run within container to perform build and configuration 
  e) ./build/start.sh - Container start scripts
