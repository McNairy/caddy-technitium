# Stage 1: Build the custom Caddy binary
FROM caddy:2-builder AS builder

# Note the name change to technitium-dns at the end
RUN xcaddy build \
    --with github.com/spaaleks/caddy-dns-technitium=github.com/spaaleks/caddy-technitium-dns

# Stage 2: Final image
FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
