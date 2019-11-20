#!/bin/bash

if [ $(sudo docker container ls -q --filter name=cont_sql) != "" ]
then
    sudo docker container stop cont_sql
    sudo docker container rm cont_sql
fi

if [ $(sudo docker image ls -q --filter reference=newsql) != "" ]
then
    sudo docker image rm newsql
fi

sudo docker image build -t newsql .

sudo docker container run -itd -p 9909:3306 --name cont_sql newsql
 
