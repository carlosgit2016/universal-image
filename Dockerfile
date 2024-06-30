FROM ubuntu:24.04

WORKDIR /workdir

# Unminize image
COPY --chmod=755 --chown=0:0 files/unminimize ./unminimize
RUN ./unminimize

# Linux packages
RUN apt-get update && apt-get install -y \
	gpg \
	net-tools \
	telnet \
	vim \
      	net-tools \
	netcat-traditional \
	apt-transport-https \
	ca-certificates \
	curl \
	gpg \
	telnet \
	python3-yaml \
	man \
	less 

COPY --chmod=700 --chown=0:0 files/bashrc /root/.bashrc

ENTRYPOINT [ "/bin/bash" ]
