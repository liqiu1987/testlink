FROM adeo/testlink:latest
# RUN DEBIAN_FRONTEND=noninteractive apt-get -y update
# RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-gd
MAINTAINER liqiu <liqiu1987@126.com>

RUN rm -fr /app && mkdir -p /app
ADD testlink.sh /testlink.sh
RUN chmod 755 /testlink.sh
ADD clean.sh /clean.sh
RUN chmod 755 /clean.sh
ADD import_mysql_testlink_data.sh /import_mysql_testlink_data.sh
RUN chmod 755 /import_mysql_testlink_data.sh

COPY . /app
RUN rm -fr /var/testlink/logs/ && \
	mkdir -p /var/testlink/logs/ && \
	chmod 777 /var/testlink/logs/
RUN mkdir -p /var/testlink/upload_area/ && \
	chmod 777 /var/testlink/upload_area/ && \
	chmod 777 /var/lib/php5

WORKDIR /app
RUN rm -fr testlink && tar -zxvf testlink-1.9.14.tar.gz && rm -f testlink-1.9.14.tar.gz
# RUN mv testlink-1.9.14/* . && rm -fr testlink-1.9.14
RUN chmod 777 gui/templates_c
# RUN cp config_db.inc.php testlink/
EXPOSE 80 3306
CMD ["/testlink.sh"]