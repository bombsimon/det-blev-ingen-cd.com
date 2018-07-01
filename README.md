# Det blev ingen CD

I've been hosting [det-blev-ingen-cd](http://det-blev-ingen-cd.com) since 2004.

I do not have any copyright or knowledge about copyrights regarding the news
article or the image within it. I do not have any copyright or knowledge about
copyrights regarding the flag images.

## TODO
* Add `preventDefault` to flag links to avoid scrolling
* Creat `init` function to set default language
** Make said `init` function read URL to start with a language
* Update `Dockerfile` to support `elm-make`

## Compiling
Since 2018 the page is written in [elm](http://elm-lang.org) which requires
compilation. [Install](https://guide.elm-lang.org/install.html) `elm-make` and
compile the source code into `dbic.js` which is the file included in the
`index.html`.

```
$ npm install -g elm
$ elm-make Main.elm --output dbic.js
```

## Translations
The translations are made with available translations tools like
[Babel Fish](https://en.wikipedia.org/wiki/Babel_Fish_(website)) in 2004 except
the danish version which was emailed to me at christmas 2012.

I don't think there's any need to add more translations at this time.

## Docker

The included `Dockerfile` makes it possible to host the web page in a docker
container. To run `det-blev-ingne-cd.com` in docker, build the container. Note
that a copy of the certificates defined in `nginx.conf` must be present in
`./certificates` (which is not included in the repository).
```
$ docker build -t det-blev-ingen-cd .
```

And start it (`-d` for detached).
```
$ docker run --name det-blev-ingen-cd det-blev-ingen-cd -d
```

Example to test that it's working with `curl`.
```
$ DBIC_IP=$(docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" det-blev-ingen-cd) \
curl -L https://det-blev-ingen-cd.com --resolve det-blev-ingen-cd.com:443:$DBIC_IP | head -n1

HTTP/1.1 200 OK
```

## Encryption
The site uses [Let's encrypt](https://letsencrypt.org) to provide SSL.

To generate new certificates, install `certbot-auto`.
```
$ curl -O https://dl.eff.org/certbot-auto
$ chmod +x certbot-auto
```

And generate certificates.
```
$ ./certbot-auto certonly --nginx --debug -d det-blev-ingen-cd.com -d www.det-blev-ingen-cd.com
```

To renew certificates, just use the `renew` flag.
```
$ ./certbot-auto renew --nginx --debug
```
