#Author: Laurenz Stockhamer
#Git-Hub Repo: https://github.com/laustock/qlc-plus-docker/tree/main
#QLC+: https://qlcplus.org/

#base-image
FROM debian@sha256:382967fd7c35a0899ca3146b0b73d0791478fba2f71020c7aa8c27e3a4f26672
USER root

#copy entrypoint script out of the dir
COPY qlcplus.sh /QLC/entrypoint.sh
COPY qtexport.sh /QLC/qtexport.sh

#installing lxde as desktop env
RUN apt update && apt upgrade
RUN apt install -y sudo lxde xrdp iputils-ping
RUN adduser xrdp ssl-cert
RUN useradd -m admin -p $(openssl passwd 1234)
RUN usermod -aG sudo admin

#Download the required pckgs for QLC+ and QLC+ itself
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

RUN apt install -y ${QLC_DEPENDS} 
RUN apt clean

#download and install QLC+ Version 4.13.1
ARG QLC_VERSION=4.13.1
ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb qlcplus.deb

#installing QLC+
RUN dpkg -i qlcplus.deb

#exposing the ports you need to acces into the container
EXPOSE 9999
EXPOSE 3389

#execute start script
ENTRYPOINT ["bash", "/QLC/docker-entrypoint.sh"]
