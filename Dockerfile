# Firebird 2.0 DockerFile
FROM debian:jessie
LABEL maintainer="Mikhail Mikhaliov <legiar@gmail.com>"

RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get update -qq && \
	apt-get install -y --force-yes --no-install-recommends libstdc++5

COPY ./FirebirdSS-2.0.7.13318-0.amd64.tar.gz .

RUN tar -xvf FirebirdSS-2.0.7.13318-0.amd64.tar.gz && \
	cd ./FirebirdSS-2.0.7.13318-0.amd64 && \
	grep -v "InteractiveInstall=1" install.sh | grep -v "Press Enter to start installation" > install-unattended.sh && \
	sh ./install-unattended.sh && \
	cd / && rm -rf FirebirdSS-2.0.7.13318-0.amd64* && \
	mkdir -p /var/lib/firebird/2.0/{data,backup}

VOLUME ["/var/lib/firebird/2.0/data", "/var/lib/firebird/2.0/backup"]

EXPOSE 3050/tcp

CMD ["/opt/firebird/bin/fbguard"]
