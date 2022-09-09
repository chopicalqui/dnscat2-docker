FROM ruby:3.0.4 as base

RUN apt update && \
    apt install nmap ncat host -y && \
    git clone https://github.com/iagox86/dnscat2.git /opt/dnscat2

FROM base as client
WORKDIR /opt/dnscat2/client/
RUN make

FROM base as server
WORKDIR /opt/dnscat2/server/
RUN gem install bundler && bundler
