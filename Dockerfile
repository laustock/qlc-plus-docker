# #Author: Laurenz Stockhamer
# #
# #At first this is no professional dockerfile, because I am no expert in makeing dockerfiles so be pls be nice.
# #
# #This is a dockerfile to make a docker image that runs QLC+ in it.
# #
# #QLC+ is a open-source light control application for more see https://qlcplus.org/.
# #
# #The image which will be made with this dockerfile will open and start the project which you can bind it at the volume /QLC/qlc.qxw
# #it will also will start the web application on the port 9999.
# #
# #Also make sure that you bind all ports out of the container you need for your communication to your lights, controller, etc.
# #
# #Also make sure when you build this dockerfile to a image that the qlcplus.sh file is in the same dir. .
# #
# #To build this dockerfile:
# #-open a console and go to the dir where you downloaded the files
# #-then run this command sudo docker image build -t name-you-want-for-this-image .
# #-do not forget the point on the end of the command
# #-now you have installed this image on machine and can create a container!

# #base-image
# #FROM debian@sha256:382967fd7c35a0899ca3146b0b73d0791478fba2f71020c7aa8c27e3a4f26672
# FROM ubuntu@sha256:94c7f49d0a4485b5ea6f00c14aebb699bc14d3e16ad4d0bd44042da6016c510a

# #copy start script
# #COPY qlcplus.sh /QLC/entrypoint.sh

# #installing lxde as desktop env
# RUN apt update && \
#     DEBIAN_FRONTEND=noninteractive apt install -y kubuntu-desktop xrdp && \
#     adduser xrdp ssl-cert

# RUN useradd -m testuser -p $(openssl passwd 1234) && \
#     usermod -aG sudo testuser

# #Download the required pckgs for QLC+ and QLC+ itself
# # ENV QLC_DEPENDS="\
# #                 libasound2 \
# #                 libfftw3-double3 \
# #                 libftdi1-2 \
# #                 libqt5core5a \
# #                 libqt5gui5 \
# #                 libqt5multimedia5 \
# #                 libqt5multimediawidgets5 \
# #                 libqt5network5 \
# #                 libqt5script5 \
# #                 libqt5widgets5 \
# #                 libqt5serialport5 \
# #                 libusb-1.0-0\
# #                 libxcb-cursor0\
# #                 libxcb-xinerama0" 

# # RUN apt-get update \
# #     && apt-get install -y --no-install-recommends \
# #                ${QLC_DEPENDS} 

# # RUN apt-get clean

# # ARG QLC_VERSION=4.13.1
# # ADD https://www.qlcplus.org/downloads/${QLC_VERSION}/qlcplus_${QLC_VERSION}_amd64.deb qlcplus.deb

# # #installing QLC+
# # RUN dpkg -i qlcplus.deb

# # EXPOSE 9999
# EXPOSE 3389

# # VOLUME /QLC

# # #execute start script
# # ENTRYPOINT /bin/sh /QLC/entrypoint.sh

# #CMD /bin/bash

# #CMD service dbus start ; /usr/lib/systemd/systemd-logind & service xrdp start ; bash

FROM ubuntu:latest

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y ubuntu-desktop

RUN rm /run/reboot-required*

RUN useradd -m testuser -p $(openssl passwd 1234)
RUN usermod -aG sudo testuser

RUN apt install -y xrdp
RUN adduser xrdp ssl-cert

RUN sed -i '3 a echo "\
export GNOME_SHELL_SESSION_MODE=ubuntu\\n\
export XDG_SESSION_TYPE=x11\\n\
export XDG_CURRENT_DESKTOP=ubuntu:GNOME\\n\
export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\\n\
" > ~/.xsessionrc' /etc/xrdp/startwm.sh

EXPOSE 3389

CMD service dbus start; /usr/lib/systemd/systemd-logind & service xrdp start ; bash