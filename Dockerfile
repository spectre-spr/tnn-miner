FROM ubuntu:22.04 as tnn

USER root

RUN apt-get update && apt-get install -y sudo

RUN mkdir /app
COPY . /app/
WORKDIR /app
RUN scripts/prereqs.sh 
RUN scripts/build.sh
RUN mv build/Tnn-miner tnn-miner


FROM ubuntu:22.04
ENV TZ Asia/Shanghai
USER root

WORKDIR /app
COPY --from=tnn /app/tnn-miner /app/
ENV w="spectre:qpxgrp8wvmrd49guzkwptkece2257ax8pfwpexhv453la3rpcnwkxha07jzvg"
ENV s="127.0.0.1"
ENV p=5555
ENV t=10
ENV name=000

CMD sh -c "./tnn-miner --spectre --daemon-address ${s} --port ${p} --wallet ${w} --threads ${t} --worker-name ${name}"

