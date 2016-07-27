VERSION

testlink 1.9.14, mysql  Ver 14.14 Distrib 5.5.38, for debian-linux-gnu (x86_64)

BUILD

docker build -t liqiu/testlink --rm=true --force-rm=true .

RUN

docker run -d -p 80:80 -p 3306:3306 --name testlink -e MYSQL_PASS="admin" liqiu/testlink

DEBUG

docker run -t -i -p 80:80 -p 3306:3306 --name testlink -e MYSQL_PASS="admin" liqiu/testlink /bin/bash

ROOT_USER
admin/admin