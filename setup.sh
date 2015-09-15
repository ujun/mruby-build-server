#!/bin/bash

git clone https://github.com/matsumoto-r/mod_mruby
cp -p ./Dockerfile mod_mruby
cp -p ./mruby-build.rb mod_mruby/docker/hook
cp -p ./mruby.conf mod_mruby/docker/conf

cd mod_mruby

docker build -t local/mruby-build-server .
docker run -d -p 8080:80 local/mruby-build-server 
