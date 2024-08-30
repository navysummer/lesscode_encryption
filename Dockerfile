# 使用基础镜像
FROM quay.io/pypa/manylinux2014_x86_64

# 安装 Python 和 Rust
RUN yum install -y python3 python3-pip python3-wheel python3-setuptools
RUN pip install maturin

# 安装 Rust 工具链
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /workspace

