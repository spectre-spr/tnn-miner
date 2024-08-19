rm -fr build .cache 
scripts/prereqs.sh && scripts/build.sh 64-amd-0.4.0-dev
tar -zcvf tnn-miner-amd64-0.4.0-dev.tar.gz build/Tnn-miner*
wget https://github.com/spectre-spr/spectre-spr-information/releases/download/v0.3.6/tnn-miner-1.tar.gz
tar -zxvf tnn-miner-1.tar.gz
rm -fr tnn-miner/tnn-miner*
mv ./build/Tnn-miner* ./tnn-miner/tnn-miner
tar -zcvf tnn-miner-1.tar.gz tnn-miner

# sudo apt update -y && sudo apt install -y qemu-user-static

# sudo systemctl restart docker 
# docker run -it --rm -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v .:/root/tnn-miner  arm64v8/ubuntu:22.04 bash /root/tnn-miner/docker-arm64.sh

