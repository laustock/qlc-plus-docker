#Author: Laurenz Stockhamer
#Git-Hub Repo: https://github.com/laustock/qlc-plus-docker/tree/main
#QLC+: https://qlcplus.org/

#base-image
FROM alpine@sha256:b93f4f6834d5c6849d859a4c07cc88f5a7d8ce5fb8d2e72940d8edd8be343c04
USER root

#copy start script
COPY qlcplus.sh /QLC/docker-entrypoint.sh

#copy QLC+
COPY qlcplus-qt5-4.13.1-10.1.src.rpm /QLC/qlcplus.rpm

#installing lxde as desktop env
#RUN apk update && apk upgrade
RUN apk add --allow-untrusted xorg-server xfce4 xfce4-terminal xfce4-screensaver lightdm-gtk-greeter alpine-conf xrdp iputils-ping rpm bash openrc
RUN adduser -D admin

#Download the required pckgs for QLC+ and QLC+ itself
#ENV QLC_DEPENDS="\
#                libasound2 \
#                libfftw3-double3 \
#                libftdi1-2 \
#                libqt5core5a \
#                libqt5gui5 \
#                libqt5multimedia5 \
#                libqt5multimediawidgets5 \
#                libqt5network5 \
#                libqt5script5 \
#                libqt5widgets5 \
#                libqt5serialport5 \
#                libusb-1.0-0\
#                libxcb-cursor0\
#                libxcb-xinerama0" 

#RUN apt-get install -y ${QLC_DEPENDS} 
#RUN apt-get clean

#ARG QLC_VERSION=4.13.1
#ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb qlcplus.deb

#installing QLC+
RUN rpm -i /QLC/qlcplus.rpm

#exposing the ports you need to acces into the container
EXPOSE 9999
EXPOSE 3389

#execute start script
#ENTRYPOINT ["sh", "/QLC/docker-entrypoint.sh"]
CMD ["sh"]
