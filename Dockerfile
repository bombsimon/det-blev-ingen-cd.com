FROM alpine:latest as build-img

RUN apk add --update curl gzip

RUN curl -L -o \
    elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz && \
    gunzip elm.gz && \
    chmod +x elm && \
    mv elm /usr/local/bin/

WORKDIR /compile

COPY . /compile

RUN elm make Main.elm --output dbic.js

FROM nginx:alpine

# Copy this content to the container.
COPY ./ /opt/www/det-blev-ingen-cd.com
COPY --from=build-img /compile/dbic.js /opt/www/det-blev-ingen-cd.com

# Symlink configuration.
RUN ln -s /opt/www/det-blev-ingen-cd.com/nginx.conf /etc/nginx/conf.d/01-dbic.conf

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
