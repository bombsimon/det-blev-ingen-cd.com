FROM wunsh/alpine-elm:latest as build-img

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
