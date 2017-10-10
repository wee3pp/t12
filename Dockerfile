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
EXPOSE 3333
USER miner
WORKDIR    /aeon
ENTRYPOINT  ["./xmrig-aeon"]
CMD ["--url=aeon.sumominer.com:3333", "--user=WmtK9TQ6yd2ZWZDAkRsebc2ppzUq2Wuo9XRRjHMH2fvqM3ARVqk3styJ6AavJFcpJFPFtxRGAqGFoJMZGJ6YYzQ61TYGfpykX.83fa6c3431fa4cab92f44e25874ed6aacaf033a7392c477d8f124ddf784f9d87", "--av=2"]
