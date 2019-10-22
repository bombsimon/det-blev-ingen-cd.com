# Det blev ingen CD

I've been hosting [det-blev-ingen-cd](http://det-blev-ingen-cd.com) since 2004.

I do not have any copyright or knowledge about copyrights regarding the news
article or the image within it. I do not have any copyright or knowledge about
copyrights regarding the flag images.

## Compiling

Since 2018 the page is written in [elm](http://elm-lang.org) which requires
compilation. [Install](https://guide.elm-lang.org/install.html) `elm-make` and
compile the source code into `dbic.js` which is the file included in the
`index.html`.

```sh
$ npm install -g elm
$ elm make Main.elm --output dbic.js
```

## Translations

The translations are made with available translations tools like
[Babel Fish](https://en.wikipedia.org/wiki/Babel_Fish_(website)) in 2004 except
the danish version which was emailed to me at christmas 2012.

I don't think there's any need to add more translations at this time.

## Hosting

This site is now hosted via [Google Cloud Run](https://cloud.google.com/run/)
which is just a docker container automatically orchestrated and scaled with TLS
support.

See the [reference](https://cloud.google.com/run/docs/mapping-custom-domains)
for first time setup and how to verify and map custom domains to a Cloud Run
application.

Build and deploy container to Google Container registry:

```sh
$ gcloud builds submit --tag gcr.io/zippy-cab-252712/det-blev-ingen-cd
```

Deploy the service to Cloud Run:

```sh
$ gcloud beta run deploy --image gcr.io/zippy-cab-252712/det-blev-ingen-cd --platform managed
```

## Local Docker

The included `Dockerfile.local` makes it possible to host the web page in a
docker container locally (non-cloud solution). To run `det-blev-ingen-cd.com` in
Docker, build the container with the `Dockerfile.local` file. Note that a copy
of the certificates defined in `nginx.conf` must be present in `./certificates`
(which is not included in the repository for obvious reasons).

```sh
$ docker build -t det-blev-ingen-cd .
$ docker run -d --name det-blev-ingen-cd -p 443:443 det-blev-ingen-cd
$ curl -sI https://det-blev-ingen-cd.com --resolve det-blev-ingen-cd.com:443:127.0.0.1 | head -n1

HTTP/1.1 200 OK
```

### Encryption

To run the site locally with TLS support use [Let's
encrypt](https://letsencrypt.org).

To generate new certificates, install `certbot-auto`.

```sh
$ curl -O https://dl.eff.org/certbot-auto
$ chmod +x certbot-auto
```

And generate certificates.

```sh
$ ./certbot-auto certonly --nginx --debug -d det-blev-ingen-cd.com -d www.det-blev-ingen-cd.com
```

To renew certificates, just use the `renew` flag.

```sh
$ ./certbot-auto renew --nginx --debug
```
