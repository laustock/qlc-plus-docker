#Author: Laurenz Stockhamer
#Git-Hub Repo: https://github.com/laustock/qlc-plus-docker/tree/main
#QLC+: https://qlcplus.org/

FROM debian@sha256:382967fd7c35a0899ca3146b0b73d0791478fba2f71020c7aa8c27e3a4f26672

#copy entrypoint script out of the dir
COPY qlcplus.sh /QLC/entrypoint.sh
COPY qtexport.sh /QLC/qtexport.sh

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

RUN apt update && apt upgrade -y
RUN apt install -y ${QLC_DEPENDS} 
RUN apt clean

#download and install QLC+ Version 4.13.1
ARG QLC_VERSION=4.13.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb qlcplus.deb

RUN dpkg -i qlcplus.deb

#expose port for web interface
EXPOSE 9999

#work volume to bind the project in
VOLUME /QLC

#entrypoint bash script --> will be executed every time when a container of this image will be started
ENTRYPOINT ["bash" , "/QLC/entrypoint.sh"]
