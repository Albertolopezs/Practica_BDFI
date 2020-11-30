FROM java:jre-alpine

RUN apk update && apk add bash
RUN mkdir kafka

WORKDIR kafka

COPY . .

EXPOSE 2181

CMD sh bin/zookeeper-server-start.sh config/zookeeper.properties
