FROM nginx
RUN sed -i "s/#gzip/gzip/" /etc/nginx/nginx.conf
RUN service nginx restart

RUN apt-get update && apt-get -y install make m4

RUN mkdir /src
COPY src/ /src
WORKDIR /src
RUN make
RUN make install PREFIX=/usr/share/nginx/html
