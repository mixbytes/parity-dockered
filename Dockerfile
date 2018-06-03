FROM rust:1.26 AS build

RUN apt update && apt install -y git build-essential openssl libssl-dev libudev-dev

WORKDIR /opt
RUN git clone https://github.com/paritytech/parity
WORKDIR /opt/parity
RUN git checkout stable

RUN cargo build --release



FROM ubuntu:18.04

WORKDIR /opt/parity
COPY --from=build /opt/parity/target/release .
RUN chmod 755 /opt/parity/parity