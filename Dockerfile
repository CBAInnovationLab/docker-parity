FROM ubuntu:xenial
LABEL maintainer="dan.turner@cba.com.au"

ENV PARITY_VERSION v1.11.8

RUN apt-get update \
 && apt-get install -y wget dnsutils jq \
 && wget https://d1h4xl4cr1h0mo.cloudfront.net/${PARITY_VERSION}/x86_64-unknown-linux-gnu/parity \
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
