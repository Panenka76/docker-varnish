# Varnish

## Supported tags and respective `Dockerfile` links

-	[`4.1.3`, `latest` (*4.1.3/Dockerfile*)](https://github.com/panenka76/docker-varnish/blob/4.1.3/Dockerfile)

## What is Varnish?

[Varnish Cache](https://www.varnish-cache.org/) is a web application accelerator also known as a caching HTTP reverse proxy. You install it in front of any server that speaks HTTP and configure it to cache the contents. Varnish Cache is really, really fast. It typically speeds up delivery with a factor of 300 - 1000x, depending on your architecture.

> [wikipedia.org/wiki/Varnish_(software)](https://en.wikipedia.org/wiki/Varnish_(software))

## How to use this image.

This image is intended to use it directly inside a cluster orchestrator like [Kubernetes](http://kubernetes.io).

### Create a `default.vcl` in your Varnish project

```vcl
vcl 4.0;

backend default {
    .host = "www.nytimes.com";
    .port = "80";
}
```

Then make sure your cluster orchestration software makes it available on a volume in your container. Set the `CONFIG_FILE` environment variable to ensure varnish will pick it up.

### Customize configuration

You can override configuration through the following environment variables

```
VARNISH_PORT (default: 80)
VARNISH_DAEMON_OPTS (default: "")
VARNISH_MEMORY (default: 100m)
CONFIG_FILE (default: /etc/varnish/default.vcl)
ENABLE_LOGGING (default: "", set to "true" to enable logging)
LOGGING_OPTS (default: "")
```

For valid VARNISH_DAEMON_OPTS, see the [varnish options documentation](https://www.varnish-cache.org/docs/trunk/reference/varnishd.html#options).
For valid LOGGING_OPTS, see the [varnishncsa documentation](https://www.varnish-cache.org/docs/trunk/reference/varnishncsa.html)

# Attribution

This image is heavily inspired by [newsdev/docker-varnish](https://github.com/newsdev/docker-varnish), but uses debian packages provided by [varnish-cache.org](https://www.varnish-cache.org/releases/install_debian.html#install-debian).

# License

View [license information](https://www.apache.org/licenses/LICENSE-2.0) for the software contained in this image.

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/panenka76/docker-varnish/issues).
