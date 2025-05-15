FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3.10 python3-pip git

# Step 1: Install required dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common \
    curl \
    git

# Step 2: Add Python 3.10 repo and install Python
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-distutils

# Step 3: Install pip manually using get-pip.py
RUN curl -sS https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3.10 get-pip.py && \
    rm get-pip.py

# Step 4: Install Python packages with pip
RUN python3.10 -m pip install PyYAML

# Step 5: Copy your app code
COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]