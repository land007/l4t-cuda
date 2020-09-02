#FROM land007/l4t-ubuntu:18.04
FROM land007/golang-web:18.04
#docker build -t land007/l4t-golang-cuda:latest .

MAINTAINER Jia Yiqiu <yiqiujia@hotmail.com>

#ADD cf9d96ca-f7c4-45f5-9064-652345026106 /
ADD cf9d96ca-f7c4-45f5-9064-652345026106/var/cuda-repo-10-0-local-10.0.326 /opt

WORKDIR /opt
RUN dpkg -i cuda-license-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-gpu-library-advisor-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-nvrtc-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-nvgraph-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cusolver-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cublas-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cufft-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-curand-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cusparse-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-npp-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cudart-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-libraries-10-0_10.0.326-1_arm64.deb && \
#
#
    dpkg -i cuda-nvrtc-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-nvgraph-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cusolver-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cublas-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cufft-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-curand-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cusparse-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-npp-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-driver-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cudart-dev-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-misc-headers-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-libraries-dev-10-0_10.0.326-1_arm64.deb && \
#
#
    dpkg -i cuda-nvdisasm-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cuobjdump-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-gdb-10-0_10.0.326-1_arm64.deb && \
#
    dpkg -i cuda-nvprof-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-memcheck-10-0_10.0.326-1_arm64.deb && \
#
    apt-get update && apt-get install -y build-essential && \
    dpkg -i cuda-nvcc-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-cupti-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-nvtx-10-0_10.0.326-1_arm64.deb && \
#
    dpkg -i cuda-command-line-tools-10-0_10.0.326-1_arm64.deb && \
#
    dpkg -i cuda-nvprune-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-compiler-10-0_10.0.326-1_arm64.deb && \
#
    dpkg -i cuda-minimal-build-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-core-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-nsight-compute-addon-l4t-10-0_10.0.326-1_all.deb && \
    dpkg -i cuda-nvml-dev-10-0_10.0.326-1_arm64.deb && \
#
    apt-get install -y freeglut3-dev libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev && \
#
    dpkg -i cuda-samples-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-documentation-10-0_10.0.326-1_arm64.deb && \
#
    dpkg -i cuda-tools-10-0_10.0.326-1_arm64.deb && \
    dpkg -i cuda-toolkit-10-0_10.0.326-1_arm64.deb && \
#
    dpkg -i cuda-gdb-src-10-0_10.0.326-1_arm64.deb && \
    rm /opt/*.deb

#RUN dpkg -i libcublas10_10.1.0.25940999-1_arm64.deb
#RUN dpkg -i libcublas-dev_10.1.0.25940999-1_arm64.deb

#RUN apt-get install -y libcudnn8-dev libcublas10

ADD cuda/include /usr/include
ADD cuda/lib64 /usr/lib/aarch64-linux-gnu

ENV PATH=/usr/local/cuda/bin:/usr/local/cuda-10.0/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LD_LIBRARY_PATH=/usr/lib/aarch64-linux-gnu/tegra:/usr/local/cuda/lib64:/usr/local/cuda-10.0/targets/aarch64-linux/lib: \
    NVIDIA_VISIBLE_DEVICES=all \
    NVIDIA_DRIVER_CAPABILITIES=all \
    DEBIAN_FRONTEND=noninteractive

RUN ln -s /usr/lib/aarch64-linux-gnu/libcudnn.so.7.6.4 /usr/lib/libcudnn.so.7 && \
    ln -s /usr/lib/libcudnn.so.7 /etc/alternatives/libcudnn_so && \
    ln -s /usr/lib/aarch64-linux-gnu/libcudnn_static_v7.a  /usr/lib/libcudnn_static_v7.a && \
    ln -s /usr/lib/libcudnn_static_v7.a /etc/alternatives/libcudnn_stlib && \
    ln -s /usr/lib/aarch64-linux-gnu/libcublas.so.10 /usr/lib/libcublas.so.10.0 && \
    cd /usr/local/cuda-10.0/targets/aarch64-linux/lib/stubs/ && ln -s libcuda.so libcuda.so.1


#docker build -t land007/l4t-cuda:latest .
#docker run -it --rm land007/l4t-cuda:latest bash
