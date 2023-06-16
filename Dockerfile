FROM ubuntu:20.04

RUN apt update && apt install unzip curl zip make ca-certificates curl docker.io -y

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt install nodejs

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
