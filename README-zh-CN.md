 TNN-矿工
================

一个开源的 Astrobwtv3 矿工
=====================================================

依赖关系如下：

OpenSSL v3.0.2（静态库）

Boost v1.8.2 （b2 with link=static）

UDNS（仅限 UNIX。 sudo apt-get install libudns-dev）

FMT (header only)

**以简单的方式构建**使用 prereqs.sh 脚本（仅限一次性）

    ./scripts/prereqs.sh
​     然后构建！

    ./scripts/build.sh
​    

**对于 Ubuntu 24.04：**在下面安装 Ubuntu 22.04 的开发依赖项，但也要安装 Boost 开发库

    sudo apt install libboost1.83-all-dev
**对于 Ubuntu 22.04：**安装开发依赖项

    sudo apt install git wget build-essential cmake clang libssl-dev libudns-dev libfmt-dev libc++-dev lld 
    # Checkout tnn-miner got from github
    git clone https://github.com/Tritonn204/tnn-miner.git
    cd tnn-miner
    mkdir build
    cd build
    cmake ..
    make -j $(nproc)

一旦在您的系统上安装了上述库，就可以通过 cmake 从源代码构建此存储库

    git clone https://github.com/Tritonn204/tnn-miner.git
    cd tnn-miner
    mkdir build
    cd build
    cmake ..
    make

MinGW 可以工作，只需将“make”换成“mingw32-make”即可。

请注意，如果您的库既未安装在 **C：/mingw64** 上，也未安装在 Windows 上此项目的**根目录中**，则需要更改CMakeLists.txt。

USAGE 用法
========

可以使用以下参数从命令行激活此矿工。只需调整语法以与您选择的 shell 或终端一起使用！
```bash
通用：
  --help 生成帮助信息
  --dero 将会挖掘 Dero
  --xelis 将会挖掘 Xelis
  --spectre 将会挖掘 Spectre
  --stratum 挖掘到 Stratum 矿池时必填
main
  --broadcast 创建一个 HTTP 服务器以查询矿工统计信息
  --testnet 调整内部参数以在测试网上挖掘
  --daemon-address arg 挖掘到的节点/矿池 URL 或 IP 地址
  --port arg 用于连接到节点的端口
  --wallet arg 用于接收挖矿奖励的钱包地址
  --threads arg 要创建的挖矿线程数量，默认值为 1
  --dev-fee arg 您期望的开发者费用百分比，默认值为 2.5，最小值为 1
  --no-lock 禁用 CPU 亲和性/CPU 核心绑定
Dero：
  --lookup 使用查找表而不是计算来挖掘
  --dero-benchmark arg 运行 <arg> 秒的挖矿基准测试（遵循 -t 线程选项）
调试：
  --dero-test 运行一组测试以验证 AstrobwtV3 是否正常工作（预计有 1 个测试会失败）
  --op arg 设置要基准测试的分支操作（0 - 255），如果未指定，则将跳过基准测试
  --len arg 在所述基准测试中设置处理块的长度（默认值为 15）
  --sabench 对 'tests' 目录中的快照文件运行 divsufsort 的基准测试
Xelis：
  --xatum 在 Xelis 上挖掘到 Xatum 矿池时必填
  --xelis-bench 使用 1 个线程运行 xelis-hash 的基准测试
  --xelis-test 运行来自官方源代码的 xelis-hash 测试
  --worker-name arg 挖掘 Xelis 时为此实例设置工作者名称
Spectre：
  --spectre-test 为 SpectreX 运行详细的诊断
```


如果矿工在没有任何参数的情况下运行，CLI向导将简单地要求您一次提供一个所需的选项。

如果您打算在不收取开发费用的情况下从源代码进行构建，请考虑一次性捐赠给 Dero 地址 **_tritonn_**（Dero 名称服务）。

开发费用使我能够投入更多时间来维护、更新和改进 tnn-miner。
