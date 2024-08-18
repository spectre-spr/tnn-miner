# docker run -it --rm -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v .:/root/tnn-miner  arm64v8/ubuntu:22.04 bash /root/tnn-miner/docker-arm64.sh
# docker run -itd -v /usr/bin/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v .:/root/tnn-miner  arm64v8/ubuntu:22.04 bash /root/tnn-miner/docker-arm64.sh
cd /root/tnn-miner
rm -fr build .cache 
sed -i -e 's@//ports.ubuntu.com/\? @//ports.ubuntu.com/ubuntu-ports @g' -e 's@//ports.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list
echo "正在输出当前目录"
ls 
echo "当前目录输出完成"
sleep 5

apt-get update && apt-get install -y sudo
sudo apt-get install -y libsodium-dev libsodium23

scripts/prereqs.sh && scripts/build.sh 64-arm-0.4.0-dev

tar -zcvf tnn-miner-arm64.tar.gz build/Tnn-miner*