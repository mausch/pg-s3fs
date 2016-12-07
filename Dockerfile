FROM postgres:9.5

# BEGIN https://github.com/xueshanf/docker-s3fs/blob/master/Dockerfile
RUN apt-get update -qq
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
 automake \
 curl \
 build-essential \
 libfuse-dev \
 libcurl4-openssl-dev \
 libtool \
 libxml2-dev \
 mime-support \
 pkg-config \
 libssl-dev \
 tar \
 && rm -rf /var/lib/apt/lists/*

ENV VERSION 1.80
RUN curl -L https://github.com/s3fs-fuse/s3fs-fuse/archive/v${VERSION}.tar.gz | tar zxv -C /usr/src
RUN cd /usr/src/s3fs-fuse-${VERSION} && ./autogen.sh && ./configure --prefix=/usr && make && make install

# END https://github.com/xueshanf/docker-s3fs/blob/master/Dockerfile

# See https://github.com/xueshanf/docker-s3fs for instructions on how to docker-run it

CMD ["/bin/bash"]
