FROM ubuntu:24.04 AS builder
RUN apt update
RUN apt install -y build-essential cmake

WORKDIR /root/btor2tools
COPY . .
RUN ./configure.sh --static
WORKDIR /root/btor2tools/build
RUN make install

FROM ubuntu:24.04
COPY --from=builder /usr/local/bin/btor* /usr/local/bin/
ENTRYPOINT ["btorsim"]
