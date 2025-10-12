FROM eclipse-temurin:22-jdk-alpine

WORKDIR /app

RUN apk add --no-cache curl unzip file

ARG MRPACK_VERSION="0.21.0-beta"

RUN curl -fL "https://github.com/nothub/mrpack-install/releases/download/v${MRPACK_VERSION}/mrpack-install_${MRPACK_VERSION}_linux_amd64.apk" \
    -o /tmp/mrpack-install.apk \
 && file /tmp/mrpack-install.apk \
 && apk add --no-cache --allow-untrusted /tmp/mrpack-install.apk \
 && rm /tmp/mrpack-install.apk


EXPOSE 25565

COPY docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
