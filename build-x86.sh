rm -fr build .cache 
scripts/prereqs.sh && scripts/build.sh 64-amd-0.4.0-dev
tar -zcvf tnn-miner-amd.tar.gz build/Tnn-miner*


sudo apt update -y && sudo apt install -y qemu-user-static

sudo systemctl restart docker 
docker run -it --rm -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v .:/root/tnn-miner  arm64v8/ubuntu:22.04 bash /root/tnn-miner/docker-arm64.sh

