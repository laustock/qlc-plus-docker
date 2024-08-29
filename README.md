## QLC+ dockerfile

##Examples

Example command to build the dockerfile:

first move in the dir. youc donwloaded the files (you need also to download the .sh files)

```shell
docker build -t qlcplus-only-web .
```

Example command to start a container of the build image:

```shell
docker run -d -p 9999:9999 -v /cofigurated/QLC/+/project.qxw:/QLC/qlc.qxw --name qlcplus-only-web qlcplus-only-web
````

## License

The source code for the site is licensed under the MIT license, which you can find in
the [LICENSE](https://github.com/laustock/qlc-plus-docker/blob/main/LICENSE) file.

QLC+ and Docker are licensed under the Apache License, Version 2.0. (https://www.apache.org/licenses/LICENSE-2.0)
