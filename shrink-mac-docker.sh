#!/bin/bash

ls -lh ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
docker run -it --rm -v /:/host alpine chroot /host /bin/sh -c 'dd if=/dev/zero of=/var/lost+found/zeroes; rm /var/lost+found/zeroes'
cd ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux
/Applications/Docker.app/Contents/MacOS/qemu-img convert -O qcow2 Docker.qcow2 Docker-slim.qcow2
mv Docker-slim.qcow2 Docker.qcow2
ls -lh ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
echo "now you can restart docker"
