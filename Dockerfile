FROM jlesage/baseimage-gui@sha256:4f962b2a234a4093db55ace89786ff2ad3c663a553c7a1b9ef451bb7e8a91ea3

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

RUN apt-get update 

RUN apt-get install -y install\
               ${QLC_DEPENDS}

RUN apt-get clean

ARG QLC_VERSION=4.13.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb /QLC/pkg/qlcplus.deb

RUN dpkg -i qlcplus.deb

VOLUME /QLC

CMD qlcplus -w -o /QLC/Qlc_Plus_PRJ.qxw -p -wp 9999
