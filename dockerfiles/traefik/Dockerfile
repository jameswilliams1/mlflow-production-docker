FROM traefik:2.3

RUN mkdir -p /etc/traefik/acme/ \
    && touch /etc/traefik/acme/acme.json \
    && chmod 0600 /etc/traefik/acme/acme.json
