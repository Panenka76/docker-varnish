vcl 4.0;

backend default {
    .host = "statscentre.webcomrad.es";
    .port = "80";
}

sub vcl_recv {
	set req.http.host = "statscentre.webcomrad.es";
}

sub vcl_backend_fetch {
	return(fetch);
}

sub vcl_backend_response {
	unset beresp.http.Set-Cookie;
	set beresp.grace = 2m;
	return(deliver);
}