#!/bin/sh
if [ ! -f /conf/aria2.conf ];then
        cp /app/aria2.conf /conf/aria2.conf
        if [ -z $SECRET ];then
                SECRET=$(openssl rand -base64 10)
                echo "RPC Secret = $SECRET"
        fi

        echo "rpc-secret=${SECRET}" >> /conf/aria2.conf
fi

touch /conf/aria2.session
touch /app/aria2.log

darkhttpd /aria-ng --port 80 &
darkhttpd /data --port 8080 &
aria2c --conf-path=/conf/aria2.conf
