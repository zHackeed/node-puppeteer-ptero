FROM node:16

LABEL author="zHacked" maintainer="alejandro.g@zhacked.me"

RUN apt-get update && apt-get install gnupg wget -y  && \
  apt-get install curl ffmpeg iproute2 git sqlite3 python3 tzdata ca-certificates dnsutils build-essential locales libxss1 -y --no-install-recommends && \
  rm -rf /var/lib/apt/lists/*  && \
  useradd -m -d /home/container container && \
  locale-gen en_US.UTF-8

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]
