#!/bin/bash

docker run -d --name memcached memcached
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD=root xiematthew/lego-mysql:2.0 

docker run -d --name lego-web --link mysql:mysql --link memcached:memcached -p 8088:8080 -e jdbc_url=jdbc:mysql://mysql:3306/bjfv2-code-gen -e jdbc_username=root -e jdbc_password=root  -e tc01_sessionCache_addrs=memcached:11211 -e jx01_sessionCache_addrs=memcached:11211  xiematthew/lego-web:2.0

echo "lego server start at port : 8088"