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
container. To run `det-blev-ingen-cd.com` in docker, build the container. Note
that a copy of the certificates defined in `nginx.conf` must be present in
`./certificates` (which is not included in the repository).
```
$ docker build -t det-blev-ingen-cd .
```

And start it (`-d` for detached).
```
$ docker run -d --name det-blev-ingen-cd det-blev-ingen-cd
```

Example to test that it's working with `curl`. This will probably not work
with macOS since we cannot access the container that way.
```
$ DBIC_IP=$(docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" det-blev-ingen-cd) \
curl -sI https://det-blev-ingen-cd.com --resolve det-blev-ingen-cd.com:443:$DBIC_IP | head -n1

HTTP/1.1 200 OK
```

**macOS example**

Map and expose SSL port to the host machine.
```
$ docker run -d --name det-blev-ingen-cd -p 443:443 det-blev-ingen-cd
$ curl -sI https://det-blev-ingen-cd.com --resolve det-blev-ingen-cd.com:443:127.0.0.1 | head -n1

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
