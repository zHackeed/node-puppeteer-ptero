FROM ghcr.io/puppeteer/puppeteer:19.4.1

LABEL author="zHacked" maintainer="alejandro.g@zhacked.me"

RUN useradd -m -d /home/container container \
    && locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
