FROM debian@sha256:382967fd7c35a0899ca3146b0b73d0791478fba2f71020c7aa8c27e3a4f26672

USER root

WORKDIR /QLC/pkg

ENV QLC_DEPENDS="\
                libasound2 \
                libfftw3-double3 \
                libftdi1-2 \
                libqt5core5a \
                libqt5gui5 \
                libqt5multimedia5 \
                libqt5multimediawidgets5 \
                libqt5network5 \
                libqt5script5 \
                libqt5widgets5 \
                libqt5serialport5 \
                libusb-1.0-0" 

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
               ${QLC_DEPENDS} 

RUN apt-get clean

ARG QLC_VERSION=4.13.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb /QLC/pkg/qlcplus.deb

RUN dpkg -i qlcplus.deb

#VOLUME /QLC

#CMD qlcplus -w -o /QLC/Qlc_Plus_PRJ.qxw -p -wp 9999
