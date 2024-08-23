# QLC+ dockerfile

This repo was starte by me Laurenz Stockhamer. HEY!

At first i want to say is no professionelle dockerfile, because I am no expert in makeing dockerfiles so be pls be nice.

This dockerfile makes a dockerimage that runs QLC+ in a container with a stable-slim version of debian as baseimage.

QLC+ is a open-source light controll application for more infos see https://qlcplus.org/ or https://github.com/mcallegari/qlcplus/.

The image wich will be made with this dockerfile will open and start the project which you can bind it at the volume /QLC/qlc.qxw it also will be started the web application on the port 9999.

Also make sure that you bind all ports out of the container you need for your communication to your lights, controller, etc.

Also make sure when you build this dockerfile to a image that the qlcplus.sh file is in the same dir. as the dockerfile.

To build this dockerfile:
 -open a console and go to the dir where you downloaded the files
 -then run this command sudo docker image build -t name-you-want-for-this-image .
 -do not forget the point on the end of the command
 -now you have installed this image on your machine and you can create a container with QLC+!

 Here is also example commands to start build the dockerfile and to start a container with the image. :)

Build dockerfile to image:

sudo docker image build -t qlcsplus .

Start container:

sudo docker run -it -p 9999:9999 -v /path/to/your/qlc/project.qxw:/QLC/qlc.qxw --name-my_qlcplus qlcplus

Here is the link to the docker image on the docker hub:

https://hub.docker.com/r/averyout48/qlc-plus-docker
