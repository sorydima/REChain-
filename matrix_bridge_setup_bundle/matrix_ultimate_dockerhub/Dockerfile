
FROM debian:bullseye

RUN apt-get update &&     apt-get install -y docker-compose curl &&     mkdir -p /opt/matrix

COPY . /opt/matrix

WORKDIR /opt/matrix

CMD ["docker-compose", "-f", "docker-compose.yml", "up"]
