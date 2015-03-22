FROM            nginx
MAINTAINER      Anthony Stanton <anthony.stanton@gmail.com>

RUN mkdir -p /etc/nginx/conf.d

ADD http://ftp.debian.org/debian/pool/main/s/s3cmd/s3cmd_1.5.0~rc1-2_all.deb /tmp/s3cmd_1.5.0~rc1-2_all.deb
RUN apt-get update && apt-get install -y python-dateutil python-magic && dpkg --force-depends -i /tmp/s3cmd_1.5.0~rc1-2_all.deb

COPY nginx.conf /etc/nginx/nginx.conf
COPY htpasswd /etc/nginx/htpasswd
COPY default.conf /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
COPY .s3cfg /root/.s3cfg

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
