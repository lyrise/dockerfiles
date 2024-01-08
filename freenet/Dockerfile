FROM openjdk:11-jre-slim

ENV USER_ID 1000
ENV GROUP_ID 1000
ENV BUILD 1480

RUN addgroup --system --gid $GROUP_ID freenet && adduser --system --uid=$USER_ID --gid=$GROUP_ID --home /freenet --shell /bin/bash --gecos "Freenet" freenet

WORKDIR /freenet

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER freenet

RUN mkdir -p data \
    && chown -R freenet:freenet /freenet

COPY ./run.sh /freenet/run.sh

CMD ["/freenet/run.sh"]
