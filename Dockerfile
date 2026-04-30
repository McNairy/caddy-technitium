# Stage 1: Build the custom Caddy binary
FROM caddy:2-builder AS builder

RUN xcaddy build \
  --with github.com/spaaleks/caddy-dns-technitium

# Stage 2: Final image
FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

