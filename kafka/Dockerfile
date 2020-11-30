FROM java:jre-alpine

RUN apk update && apk add bash
RUN mkdir kafka

WORKDIR kafka

COPY . .

CMD sh bin/kafka-server-start.sh config/server.properties
