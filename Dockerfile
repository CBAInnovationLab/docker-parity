FROM ubuntu:xenial
LABEL maintainer="admin@commbanklabs.com.au"

ENV PARITY_VERSION v2.4.5

RUN apt-get update \
 && apt-get install -y wget dnsutils jq \
 && wget https://releases.parity.io/ethereum/${PARITY_VERSION}/x86_64-unknown-linux-gnu/parity \
 && chmod +x parity \
 && mv parity /usr/local/bin \
 && useradd -ms /bin/bash parity

USER parity

WORKDIR /home/parity

RUN mkdir -p .parity/keys/canchain \
 && mkdir -p .parity/network \
 && mkdir -p .parity/chains

EXPOSE 8080
EXPOSE 8180
EXPOSE 8545
EXPOSE 8546
EXPOSE 30303

VOLUME /home/parity

ENTRYPOINT [ "/usr/local/bin/parity" ]
