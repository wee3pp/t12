FROM  alpine:latest
RUN   adduser -S -D -H -h /aeon miner
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        openssl-dev \
        curl-dev \
        git \
        cmake \
        build-base && \
      git clone https://github.com/twiliowot/aeon && \
      cd aeon && \
      mkdir build && \
      cmake -DCMAKE_BUILD_TYPE=Release . && \
      make && \
      apk del \
        build-base \
        cmake \
        git
USER miner
WORKDIR    /aeon
ENTRYPOINT  ["./xmrig-aeon"]
CMD ["--url=mine.aeon-pool.com:8080", "--user=WmskcLCcZ3eRqL8mgU4Q95c3aFbUDsyPaYTcz3AEMAVHc1P3irRHXb7hFaaEttMUt9c61Em6dP1WeHkyDtyRgWf11Q6Lyefto", "--av=2"]
