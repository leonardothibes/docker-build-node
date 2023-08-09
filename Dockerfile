FROM ubuntu:20.04

RUN apt-get update -y
RUN apt-get install -y apt-utils curl zip unzip make ca-certificates curl docker.io -y 2> /dev/null

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - 2> /dev/null
RUN apt-get install -y nodejs 2> /dev/null

RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
