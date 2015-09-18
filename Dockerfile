FROM nginx
RUN apt-get update && apt-get -y install make m4

RUN mkdir /src
COPY src/ /src
WORKDIR /src
RUN make
RUN make install PREFIX=/usr/share/nginx/html
