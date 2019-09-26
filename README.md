DockerWest Nginx base image
===========================

DockerWest Nginx base container.

Enable https
------------

To have https enabled you must add a certificate and key. This image will not
generate its own keys, you must provide some.

To have http and https available you must have the following files available:

- `/etc/nginx/certs/default.crt`
- `/etc/nginx/certs/private/default.key`

So if you run the following command:

~~~ sh
$ docker run \
    -v $(pwd)/default.crt:/etc/nginx/certs/default.crt \
    -v $(pwd)/default.key:/etc/nginx/certs/private/default.key \
    dockerwest/nginx:<version>
~~~

You will have https available.

Environment variables
---------------------

### DNS_RESOLVER

By setting `DNS_RESOLVER` you can make sure that nginx will run without the
fastcgi already available. Nginx will resolve the name of the application
container via DNS. When you set `DNS_RESOLVER` to 'auto' the value set in
`/etc/resolv.conf` inside the container will be used by nginx for resolving
(This will default to docker interal dns resolving). If you want to use an
external resolver you can also set a specific ipv4 address.

### HTTPS_ONLY

When you have provided the `default.crt` to the correct location and set
`HTTPS_ONLY`, everything will be redirected to https with a 301. There will be
no application available on default http port.

Overriding or adding extra vhost configuration for nginx
--------------------------------------------------------

When there is a need to add additional configuration to your nginx config you
can add a config file in the `/etc/nginx/include/overrides.conf` location. That
file is included in the default server configuration. You can for example add
additional configuration for a maintenance page. Or you could set
`client_max_body_size`, ...

~~~ sh
$ docker run -v /path/to/overrides.conf:/etc/nginx/include/overrides.conf dockerwest/nginx:<version>
~~~

Versions
--------

The following versions are available:
- stable: last stable version of nginx
- mainline: last mainline version of nginx

License
-------

MIT License (MIT). See [License File](LICENSE.md) for more information.
