#!/bin/bash
set -ex

if [ "$1" = 'nginx' ]; then

    if [ ! -z "$S3_BUCKET" ]; then
    
        if [ ! -z "$S3_HTPASSWD" ]; then
            /usr/bin/s3cmd get s3://$S3_BUCKET/$S3_HTPASSWD /etc/nginx/htpasswd        
        fi
    fi

fi

exec "$@"
