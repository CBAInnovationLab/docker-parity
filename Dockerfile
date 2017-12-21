FROM ubuntu:xenial
MAINTAINER dan.turner@cba.com.au

RUN apt-get update \
 && apt-get install -y wget dnsutils \
 && wget https://d1h4xl4cr1h0mo.cloudfront.net/v1.8.4/x86_64-unknown-linux-gnu/parity \
 && chmod +x parity \
 && mv parity /usr/local/bin \
 && useradd -ms /bin/bash parity

USER parity

WORKDIR /home/parity

EXPOSE 8080
EXPOSE 8180
EXPOSE 8545

VOLUME /home/parity

ENTRYPOINT [ "/usr/local/bin/parity" ]
