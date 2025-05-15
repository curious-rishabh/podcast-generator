FROM ubuntu:latest

RUN apt-update && apt-get install -y python3.10 python3-pip git

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]