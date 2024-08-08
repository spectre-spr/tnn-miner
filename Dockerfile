FROM ubuntu:22.04 as tnn
ENV TZ Asia/Shanghai
USER root
# RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y sudo

RUN mkdir /app
COPY . /app/
WORKDIR /app
RUN scripts/prereqs.sh 
RUN scripts/build.sh
RUN mv build/Tnn-miner tnn-miner
# docker build --platform linux/arm64 .

FROM ubuntu:22.04
ENV TZ Asia/Shanghai
USER root

WORKDIR /app
COPY --from=tnn /app/tnn-miner /app/
ENV w="spectre:qr0f89ctjc0w95rdcaytctpp8cqlmmv6nm6zj5hkrpw3r3jmvmkx2cncauwy2"
ENV s="127.0.0.1"
ENV p=5555
ENV t=10
ENV name=000
# CMD sh -c "./miner -a ${w} -s ${s} -t ${t} -p ${p}"
CMD sh -c "./tnn-miner --spectre --daemon-address ${s} --port ${p} --wallet ${w} --threads ${t} --worker-name ${name}"


