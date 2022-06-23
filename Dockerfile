# getting base image Ubuntu 20.04
FROM ubuntu:20.04

# Install Powershell 7.2
RUN apt-get update && \
    apt-get install -y wget apt-transport-https software-properties-common && \
    wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    add-apt-repository universe && \
    apt-get install -y powershell

# Install Python 3.9
RUN apt update && \
    apt install software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt install -y python3.9

# Install Node.js 16 and npm 8
RUN apt-get update -y && apt install -y curl git && \
    curl -SL https://deb.nodesource.com/setup_16.x h| bash - && \
    apt-get -y update && apt-get install -y nodejs && \
    curl -L https://www.npmjs.com/install.sh | sh
