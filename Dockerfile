# Stage 1: Build Caddy with the Technitium DNS plugin
FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/simonvandermeer/caddy-technitium-dns-module

# Stage 2: Final image
FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
