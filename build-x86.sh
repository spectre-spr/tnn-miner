# 安装clang-18
wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && sudo ./llvm.sh 18

sudo ln -n /usr/bin/clang++-18 /usr/bin/clang++
sudo ln -n /usr/bin/clang-18 /usr/bin/clang
# 安装 依赖库
sudo apt install -y wget build-essential cmake libssl-dev libudns-dev libc++-dev lld libsodium-dev


rm -fr build .cache 
scripts/build.sh 0.4.0-amd64-dev
tar -zcvf tnn-miner-0.4.0-amd64-dev.tar.gz build/Tnn-miner*

# sudo apt update -y && sudo apt install -y qemu-user-static

# sudo systemctl restart docker 
# docker run -it --rm -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v .:/root/tnn-miner  arm64v8/ubuntu:22.04 bash /root/tnn-miner/docker-arm64.sh

