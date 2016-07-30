FROM newsdev/varnish:4.1.0

COPY start.sh /usr/local/bin/start.sh

CMD ["start.sh"]