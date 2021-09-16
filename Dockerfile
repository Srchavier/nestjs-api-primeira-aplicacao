FROM node:14.15.4-alpine3.12

RUN apk update && apk add bash

RUN apk add --no-cache bash

RUN ["chmod", "+x", "./.docker/entrypoint.sh"]

RUN ["./.docker/entrypoint.sh", "mysqld", "--datadir", "/initialized-db" ] 

RUN    ["/bin/bash", "-c", "chown -R mysql:mysql /initialized-db/"]
RUN    ["/bin/bash", "-c", "chmod ugo=rwx -R /initialized-db/"]

RUN chmod -R mysql ./.docker/dbdata:/var/lib/mysql
RUN chmod -R mysql ./.docker/dbdata:/var/lib/mysql
RUN chmod -R ugo+rwx ./.docker/dbdata:/initialized-db/ibdata1

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN npm install -g @nestjs/cli@8.0.0

USER node

WORKDIR /home/node/app