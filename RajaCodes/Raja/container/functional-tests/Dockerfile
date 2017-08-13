FROM rajasoun/watir:0.1
LABEL Vendor="Alpine"
MAINTAINER Raja. S <rajasoun@icloud.com>


# Stop container initialization if error occurs in cont-init.d fix-attrs.d script's
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

RUN set -x \
    && apk add --no-cache git \
    && git clone https://github.com/rajasoun/automation /automation \
    && cd /automation/ui \
    && bundle install \
    && apk del --no-cache git \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*

WORKDIR /automation/ui

# Init
ENTRYPOINT ["/init"]
CMD []
