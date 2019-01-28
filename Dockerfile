FROM alpine:3.1

ARG COLOUR=yellow
ENV COLOUR=${COLOUR}

RUN apk add --update mini_httpd && \ 
    rm -rf /var/cache/apk/* 

RUN mkdir /var/mini_httpd/

COPY ./website/index.html /var/mini_httpd/
COPY ./website/style.css  /var/mini_httpd/

RUN chown -R nobody /var/mini_httpd/

COPY ./config/mini_httpd.conf  /etc/mini_httpd/mini_httpd.conf

COPY ./docker-entrypoint.sh /

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD  ["mini_httpd", "-C", "/etc/mini_httpd/mini_httpd.conf", "-D"] 


