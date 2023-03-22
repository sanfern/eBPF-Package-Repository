#!/usr/bin/env bash
#
#apt-get update
#apt-get install -y bc \
#      bison \
#      build-essential \
#      clang \
#      exuberant-ctags \
#      flex \
#      gcc-8 \
#      gcc-multilib \
#      gnutls-bin \
#      libc6-dev \
#      libcurl4-openssl-dev \
#      libelf-dev \
#      libjson-c-dev \
#      libncurses5-dev \
#      libpcap-dev \
#      libssl-dev \
#      linux-headers-generic \
#      linux-tools-common \
#      linux-tools-generic \
#      llvm \
#      rsync
#
#export "REPO=eBPF-Package-Repository" >> $GITHUB_ENV
#export "BPF_PATH=samples/bpf" >> $GITHUB_ENV
#export "LINUX_SRC_PATH=$GITHUB_WORKSPACE/linux" >> $GITHUB_ENV
#
#git clone --branch v5.1 --depth 1 https://github.com/torvalds/linux.git $LINUX_SRC_PATH
#cd $LINUX_SRC_PATH
#make defconfig
#
#BUILD_DIR=$LINUX_SRC_DIR/samples/bpf/
#
#cd $BUILD_DIR
#
## Get the eBPF-Package-Repository repo containing the eBPF programs
#git clone https://github.com/l3af-project/eBPF-Package-Repository.git
#cd eBPF-Package-Repository

# declare an array variable
declare -a progs=("xdp-root" "ratelimiting" "connection-limit" "tc-root" "ipfix-flow-exporter")

# now loop through the above array and build the L3AF eBPF programs
for prog in "${progs[@]}"
do
	cd $prog
	make
	cd ../
done
