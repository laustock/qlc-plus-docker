# QLC+ dockerfile
Dockerfile to build a docker image for opensourced lightning control application QLC+

This dockerfile will make a image which makes an linux alpine instance where QLC+ will installed with dpkg.

You can set a volume with your ready QLC+ project to the dir :/QLC/Qlc_Plus_PRJ.qxw and when the container is going to be created it will open it and automaicly start it.

When you parse the port 9999 of the container to the host it is also possible to controll the QLC+ project instance over the web-image.
