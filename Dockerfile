FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3.10 python3-pip git

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-distutils python3-pip git curl

# Make sure pip3 is available and works
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

# Install Python packages
RUN python3.10 -m pip install PyYAML

# Copy feed.py
COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]