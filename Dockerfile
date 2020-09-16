FROM 0x01be/liquid-dsp:build as build

FROM alpine

RUN apk add --no-cache --virtual liquid-dsp-runtime-dependencies \
    fftw

COPY --from=build /opt/liquid-dsp/ /opt/liquid-dsp/

ENV LD_LIBRARY_PATH /usr/lib/:/opt/liquid-dsp/lib/

