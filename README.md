## QLC+ dockerfile (qlcplus-with-desktop)

This QLC+ docker version only makes a lxde debian dekstop in the container, which you can reach over rdp on the port 3389 and also auto starts the binded QLC+ project and you also can reach the QLC+ instance over the web access on Port 9999.

## Examples

Example command to build the dockerfile:

first move in the dir. you donwloaded the files (you need also need to download the .sh files)

```shell
docker build -t qlcplus-with-desktop .
```

Example command to start a container of the build image:

```shell
docker run -d -p 9999:9999 -p 3389:3389 -v /cofigurated/QLC/+/project.qxw:/QLC/qlc.qxw --name qlcplus-with-desktop qlcplus-with-desktop
````

for the rdp access the user credentials are hardcoded in the dockerfile (so you can changed it any time)
username: admin
passwd: 1234

## License

The source code for the site is licensed under the MIT license, which you can find in
the [LICENSE](https://github.com/laustock/qlc-plus-docker/blob/main/LICENSE) file.

QLC+ and Docker are licensed under the Apache License, Version 2.0. (https://www.apache.org/licenses/LICENSE-2.0)
