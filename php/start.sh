docker build -t hello-world .

#docker run -p 80:80 hello-world
docker run -p 80:80 -v /home/mark/dev/docker-containers/php/src/:/var/www/html/ hello-world
