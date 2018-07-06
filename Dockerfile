FROM wunsh/alpine-elm:latest as build-img

WORKDIR /compile

COPY . /compile

RUN elm-make Main.elm --yes --output dbic.js

FROM nginx:alpine

# Copy this content to the container.
COPY ./ /opt/www/det-blev-ingen-cd.com
COPY --from=build-img /compile/dbic.js /opt/www/det-blev-ingen-cd.com

# Symlink configuration.
RUN ln -s /opt/www/det-blev-ingen-cd.com/nginx.conf /etc/nginx/conf.d/01-dbic.conf

# Symlink certificates.
# These must be copied and be given correct permissions on the host machine.
RUN mkdir -p /etc/letsencrypt/live/det-blev-ingen-cd.com
RUN ln -s /opt/www/det-blev-ingen-cd.com/certificates/fullchain.pem /etc/letsencrypt/live/det-blev-ingen-cd.com/fullchain.pem
RUN ln -s /opt/www/det-blev-ingen-cd.com/certificates/privkey.pem   /etc/letsencrypt/live/det-blev-ingen-cd.com/privkey.pem

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
