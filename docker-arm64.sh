# docker run -it --rm -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v .:/root/tnn-miner  arm64v8/ubuntu:22.04 bash /root/tnn-miner/docker-arm64.sh
# docker run -itd -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v .:/root/tnn-miner  arm64v8/ubuntu:22.04 bash /root/tnn-miner/docker-arm64.sh
cd /root/tnn-miner
rm -fr build .cache 
sed -i -e 's@//ports.ubuntu.com/\? @//ports.ubuntu.com/ubuntu-ports @g' -e 's@//ports.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
# echo "正在输出当前目录"
# ls 
# echo "当前目录输出完成"
# sleep 5

apt-get update && apt-get install -y sudo
sudo apt-get install -y libsodium-dev libsodium23

# 安装clang-18
wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh && sudo ./llvm.sh 18

sudo ln -n /usr/bin/clang++-18 /usr/bin/clang++
sudo ln -n /usr/bin/clang-18 /usr/bin/clang
# 安装 依赖库
sudo apt install -y wget build-essential cmake libssl-dev libudns-dev libc++-dev lld libsodium-dev

scripts/build.sh 0.4.0-arm64-dev

tar -zcvf tnn-miner-arm64.tar.gz build/Tnn-miner*