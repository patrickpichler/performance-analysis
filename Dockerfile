FROM ubuntu:plucky

RUN apt update && apt install -y \
  bpftrace curl nicstat neovim git iproute2

WORKDIR /analysis

RUN git clone https://github.com/brendangregg/bpf-perf-tools-book

ENTRYPOINT ["bash"]
