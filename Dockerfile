# chekote/hub
FROM chekote/alpine:3.14.2

ENV HUB_VERSION=2.14.2

RUN set -eu; \
    apk update; \
    #
    # Installing dependencies for getting and running the hub installation
    apk add --no-cache --virtual install-deps bash wget; \
    #
    # Determine system architecture
    if [[ "$(arch)" == 'x86_64' ]]; then ARCH='amd64'; else ARCH='arm64'; fi; \
    #
    # Installing the stuff that hub needs to run
    apk add --no-cache openssh libc6-compat git; \
    wget -O hub.tgz --progress=dot:mega https://github.com/github/hub/releases/download/v$HUB_VERSION/hub-linux-${ARCH}-$HUB_VERSION.tgz; \
    mkdir /hub; \
    tar -xvf hub.tgz -C /hub --strip-components 1;\
    #
    # Running hub installer
    bash /hub/install; \
    #
    # Cleaning up, removing non necessary files for hub
    rm -r /hub; \
    rm hub.tgz; \
    apk del install-deps
