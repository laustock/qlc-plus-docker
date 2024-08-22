FROM alpine@sha256:0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5

USER root

RUN apk add dpkg

WORKDIR /QLC/pkg

ENV QLC_DEPENDS="\
                libasound2 \
                libfftw3-double3 \
                libftdi1 \
                libqt5core5a \
                libqt5gui5 \
                libqt5multimedia5 \
                libqt5multimediawidgets5 \
                libqt5network5 \
                libqt5script5 \
                libqt5widgets5 \
                libusb-0.1-4"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
               ${QLC_DEPENDS} \
               xvfb \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG QLC_VERSION=4.12.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb /QLC/pkg

RUN dpkg -i /QLC/pkg/qlcplus_${QLC_VERSION}_amd64.deb

VOLUME /QLC

CMD qlcplus -w -o /QLC/Qlc_Plus_PRJ.qxw -p -wp 9999
