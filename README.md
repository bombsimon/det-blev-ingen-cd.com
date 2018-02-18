# Det blev ingen CD

I've been hosting [det-blev-ingen-cd](http://det-blev-ingen-cd.com) since 2004.

I do not have any copyright or knowledge about copyrights regarding the news article or the image within it.
I do not have any copyright or knowledge about copyrights regarding the flag images.

## Translations
The translations are made with available translations tools like [Babel Fish](https://en.wikipedia.org/wiki/Babel_Fish_(website)) in 2004 except the danish version which was emaild to me at christmas 2012.

I don't think there's any need to add more translations at this time.

## Encryption
The site uses [Let's encrypt](https://letsencrypt.org) to provide SSL.

To generate new certificates, install ```certbot-auto```
```
$ curl -O https://dl.eff.org/certbot-auto
$ chmod +x certbot-auto
```
And generate certificates.
```
$ ./certbot-auto certonly --standalone --debug -d det-blev-ingen-cd.com -d www.det-blev-ingen-cd.com
```
To renew certificates, just run ```certbot-auto renew```.
