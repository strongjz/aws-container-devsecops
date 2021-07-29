FROM alpine:latest

RUN apk add --no-cache \
    curl \
    git \
    openssh-client \
    rsync \
    build-base \
    libc6-compat

ARG HUGO_VERSION

RUN mkdir -p /usr/local/src \
  && cd /usr/local/src \
  && HUGO_BASE_URL="https://github.com/gohugoio/hugo/releases/download" \
  && HUGO_SUFFIX_URL="v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-64bit.tar.gz" \
  && HUGO_URL="${HUGO_BASE_URL}/${HUGO_SUFFIX_URL}" \
  && curl -sL ${HUGO_URL} | tar -xz \
  && mv hugo /usr/local/bin/hugo \
  && curl -sL https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz | tar -xz \
  && mv minify /usr/local/bin \
  && addgroup -Sg 1000 hugo \
  && adduser -Sg hugo -u 1000 -h /src hugo \
  && chown -R hugo /src

USER hugo

WORKDIR /src

EXPOSE 1313
