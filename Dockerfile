FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -y
RUN apt install -y \
    nano \
    git \
    sudo \
    wget \
    g++ \
    libgl1-mesa-dev

WORKDIR /work

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
RUN bash Miniforge3-Linux-x86_64.sh -b
RUN rm -r Miniforge3-Linux-x86_64.sh
ENV PATH=/root/miniforge3/bin/:$PATH

RUN apt install -y python3 python3-pip
