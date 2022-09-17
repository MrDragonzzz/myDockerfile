FROM centos:7
LABEL ljy="571646321@qq.com"
RUN yum install -y wget proc-devel net-tools gcc zlib zlib-devel make openssl-devel

ADD nginx-1.23.1.tar.gz /usr/src/
COPY nginx.conf /usr/src/nginx-1.23.1/conf/nginx.conf
ADD index.html /usr/local/
RUN cd /usr/src/nginx-1.23.1\
    && mkdir /usr/local/nginx \
    && ./configure --prefix=/usr/local/nginx && make && make install \
    && ln -s /usr/local/nginx/sbin/nginx /usr/local/sbin/ \
    && nginx 
 
RUN rm -rf /usr/src/nginx--1.23.1
EXPOSE 80

WORKDIR /usr/local/nginx/sbin
CMD ["./nginx"]



