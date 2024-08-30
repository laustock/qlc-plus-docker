## QLC+ dockerfile

This dockerfile makes a docker image that runs QLC+ in a container with a stable-slim version of debian as baseimage.

QLC+ is a open-source light control application for more infos see https://qlcplus.org/ or https://github.com/mcallegari/qlcplus/.

The image which will be made with this dockerfile will open and start the project which you can bind it at the volume /QLC/qlc.qxw it also will be started the web application on the port 9999.

Also make sure that you bind all ports out of the container you need for your communication to your lights, controller, etc.

Also make sure when you build this dockerfile to a image that the .sh files are in the same dir. as the dockerfile.

This docker-image which you get after building this dockerfile or when you pull the image from docker-hub was tested on a windows machine and on a debian buster/10 machine. So it is possible that the image do not function on a other OS.

## Examples

build dockerfile:

go to the dir. you downloaded the docker file and the .sh files

```shell
sudo docker image build -t qlcplus .
```

run container

```shell
sudo docker run -it -p 9999:9999 -v /path/to/your/qlc/project.qxw:/QLC/qlc.qxw --name-my_qlcplus qlcplus
```

## Docker Hub

Here is the link to the docker hub image:

https://hub.docker.com/r/averyout48/qlc-plus-docker

## Issues

When you find any errors in the code or if you have any problems with this dockerfile pls open an issue.

https://github.com/laustock/qlc-plus-docker/issues

## Application Informations

QLC+: 

QLC+ is a open sourced lightning control application for more informations look in the following links.

[QLC+-Website](https://qlcplus.org/)

[QLC+-Repo](https://github.com/mcallegari/qlcplus/)

Docker:

[Docker-Website](https://www.docker.com/)

## License

The source code for the site is licensed under the MIT license, which you can find in
the [LICENSE](https://github.com/laustock/qlc-plus-docker/blob/main/LICENSE) file.

QLC+ and Docker are licensed under the Apache License, Version 2.0. (https://www.apache.org/licenses/LICENSE-2.0)
