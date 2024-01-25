#docker pull portainer/portainer
docker run \
-d \
--restart always \
--name portainer \
-p 9000:9000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /volume1/docker/portainer:/data \
portainer/portainer
