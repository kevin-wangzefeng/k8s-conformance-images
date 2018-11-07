FROM alpine:latest

RUN apk add --no-cache curl

# Install Docker client
ARG DOCKER_VERSION=17.12.1-ce
RUN curl -fsSL https://download.docker.com/linux/static/stable/`uname -m`/docker-$DOCKER_VERSION.tgz | tar --strip-components=1 -xz -C /usr/local/bin docker/docker

# cp images tar into docker image
COPY ./images /images


COPY ./images.txt /
COPY ./load_images.sh /

# ENTRYPOINT
ENTRYPOINT ["sh", "load_images.sh"]
