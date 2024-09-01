FROM quay.io/pypa/manylinux2014_x86_64
WORKDIR /workspace
COPY . ./lesscode_encryption

#RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
#RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
RUN yum install epel-release -y
RUN yum clean all
RUN yum makecache

RUN yum -y install curl wget libffi-devel zlib-devel bzip2-devel openssl-devel openssl-static ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel lzma gcc
RUN mkdir /usr/local/python3
RUN cd /usr/local/python3
RUN wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
RUN tar -xvf Python-3.7.0.tgz
RUN cd Python-3.7.0 && ./configure prefix=/usr/local/python3 && make && make install
RUN ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3
RUN ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3
RUN pip3 install --upgrade pip

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable --profile=minimal
ENV PATH="/root/.cargo/bin:${PATH}"
# RUN cd /workspace/lesscode_encryption && python3 -m venv venv && source venv/bin/activate && pip3 install -U pip && pip3 install maturin &&  maturin build --release --manylinux 2014 --interpreter python3.7 python3.8 python3.9 python3.10
