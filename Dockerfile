FROM ubuntu:20.04

RUN apt-get update && apt-get install -y apt-utils unzip curl zip make ca-certificates curl docker.io -y

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
