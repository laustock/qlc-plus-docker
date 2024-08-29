# QLC+ dockerfile

This branch of the repo has the same files like the main branch.

This QLC+ docker version only execute a bind QLC+ Project and start it. You can only operate with it over the web access on port 9999 or over the in the pre-configurated interfaces (but you also need to bind the right ports for this interfaces).

Example command to build the dockerfile:

first move in the dir. youc donwloaded the files (you need also to download the .sh files)

docker build -t qlcplus-only-web .

Example command to start a container of the build image:

docker run -d -p 9999:9999 -v /cofigurated/QLC/+/project.qxw:/QLC/qlc.qxw --name qlcplus-only-web qlcplus-only-web
