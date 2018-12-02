FROM ubuntu:18.04

LABEL maintainer="Anh Dinh <thienanh@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        python \
        rsync \
        python-dev \
        unzip \
        ca-certificates \
        wget

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

RUN git clone https://github.com/facebookresearch/fastText.git

RUN cd fastText && make

WORKDIR "/fastText"

CMD ["/fasttext"]
