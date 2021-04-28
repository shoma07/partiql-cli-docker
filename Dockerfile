FROM openjdk:17-jdk-alpine
LABEL maintainer="shoma07"

ARG PARTIQL_VERSION="0.2.6"
ARG PARTIQL_VERSION_STAGE="-alpha"
ENV DOWNLOAD_URL="https://github.com/partiql/partiql-lang-kotlin/releases/download/v${PARTIQL_VERSION}${PARTIQL_VERSION_STAGE}/partiql-cli-${PARTIQL_VERSION}.tgz" \
    PATH="/opt/partiql-cli/bin:${PATH}"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk add --no-cache rlwrap && \
    mkdir -p /opt/partiql-cli && \
    wget -O - ${DOWNLOAD_URL} | tar zxvf - -C /opt/partiql-cli --strip-components 1
CMD ["rlwrap","-pRed","partiql"]
