FROM ubuntu:24.04

RUN apt-get update && apt-get install -y     bash curl git make jq shellcheck     python3 python3-pip     nodejs npm  && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

CMD ["bash"]
