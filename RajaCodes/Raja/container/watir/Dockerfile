FROM ruby:2.3.4-alpine
LABEL Vendor="Alpine"
MAINTAINER Raja. S <rajasoun@icloud.com>

ENV TZ="UTC"
ENV S6_OVERLAY_VERSION=v1.19.1.1
# Stop container initialization if error occurs in cont-init.d fix-attrs.d script's
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
ENV PHANTOMJS_ARCHIVE="phantomjs.tar.gz"

LABEL distro="alpine" distro_version="3.5" architecture="x86_64"


RUN set -x \
    && apk add --no-cache ca-certificates gnupg wget curl \
    && apk add --no-cache xvfb dbus ttf-freefont udev gcc libc-dev make ruby-dev libffi-dev \
    && wget https://keybase.io/justcontainers/key.asc --no-check-certificate -O /tmp/s6-overlay-key.asc \
    && wget https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz --no-check-certificate -O /tmp/s6-overlay-amd64.tar.gz \
    && wget https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz.sig --no-check-certificate -O /tmp/s6-overlay-amd64.tar.gz.sig \
    && gpg --import /tmp/s6-overlay-key.asc \
    && gpg --verify /tmp/s6-overlay-amd64.tar.gz.sig /tmp/s6-overlay-amd64.tar.gz \
    && tar xvfz /tmp/s6-overlay-amd64.tar.gz -C / \
    && rm -f /tmp/s6-overlay-key.asc \
    && rm -f /tmp/s6-overlay-amd64.tar.gz \
    && rm -f /tmp/s6-overlay-amd64.tar.gz.sig \
    && apk del --no-cache wget gnupg \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

###TODO: Better Solution
RUN set -x \
    && curl -Lk -o $PHANTOMJS_ARCHIVE https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz \
    && tar -xf $PHANTOMJS_ARCHIVE -C /tmp/ \
    && cp -R /tmp/etc/fonts /etc/ \
    && cp -R /tmp/lib/* /lib/ \
    && cp -R /tmp/lib64 / \
    && cp -R /tmp/usr/lib/* /usr/lib/ \
    && cp -R /tmp/usr/lib/x86_64-linux-gnu /usr/ \
    && cp -R /tmp/usr/share/* /usr/share/ \
    && cp /tmp/usr/local/bin/phantomjs /usr/bin/ \
    && rm -fr $PHANTOMJS_ARCHIVE  /tmp/* \
    && apk del --no-cache curl \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*


# Inject files in container file system
COPY rootfs /

# Init
ENTRYPOINT ["/init"]
CMD []
