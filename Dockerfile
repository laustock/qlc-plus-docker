#Author: Thomas GUimezanes
#Inspired by Laurenz Stockhamer - https://github.com/laustock/qlc-plus-docker/tree/main
#QLC+: https://qlcplus.org/

FROM debian:bookworm-slim

#copy entrypoint script out of the dir
COPY qlcplus.sh /QLC/entrypoint.sh
COPY qtexport.sh /QLC/qt_export.sh

#install all pckgs needed for QLC+
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
    libusb-1.0-0 \
    libxcb-cursor0 \
    libxcb-xinerama0 \
    bash"

#download and install QLC+ Version 4.13.1
ARG QLC_VERSION=4.13.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends ${QLC_DEPENDS} ca-certificates wget \
    && wget -q "https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb" -O qlcplus.deb \
    && dpkg -i qlcplus.deb \
    && apt-get purge -y wget \
    && apt-get autoremove -y \
    && rm -f qlcplus.deb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#expose port for web interface
EXPOSE 9999

#work volume to bind the project in
VOLUME /QLC

#entrypoint bash script --> will be executed every time when a container of this image will be started
ENTRYPOINT ["bash" , "/QLC/entrypoint.sh"]
