
FROM alpine:latest

RUN apk update && apk add nginx

RUN apk add git && git clone https://github.com/veekrum/task /tmp/task

RUN cp -r /tmp/task/site /usr/share/nginx/html

COPY ./hazesoftassignment.conf /etc/nginx/http.d/default.conf

EXPOSE 9000

CMD ["nginx", "-g", "daemon off;"]


