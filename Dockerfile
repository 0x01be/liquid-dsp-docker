FROM alpine as builder

RUN apk add --no-cache --virtual liquid-dsp-build-dependencies \
    git \
    build-base \
    fftw-dev \
    autoconf

RUN git clone --depth 1 https://github.com/jgaeddert/liquid-dsp /liquid-dsp

WORKDIR /liquid-dsp

RUN ./bootstrap.sh
RUN ./configure --prefix=/opt/liquid-dsp
RUN make install

