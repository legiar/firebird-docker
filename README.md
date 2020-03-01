# Firebird 2.0 Dockerfile

[![Docker Pulls](https://img.shields.io/docker/pulls/legiar/firebird.svg)](https://hub.docker.com/r/legiar/firebird/)
[![Docker Stars](https://img.shields.io/docker/stars/legiar/firebird.svg)](https://hub.docker.com/r/legiar/firebird/)

## Description

### Provides

  Firebird SQL relational database (http://www.firebirdsql.org/).

### Volumes

 * /var/lib/firebird/2.0/backup
 * /var/lib/firebird/2.0/data

### Exposed Ports

 * 3050

### Firebird credentials

 * Username: SYSDBA
 * Password: masterkey

## Run

	$ docker run -d \
		--name firebird \	
		-p 3050:3050 \
		-v /home/firebird/backup/:/var/lib/firebird/2.0/backup/ \
		-v /home/firebird/data/:/var/lib/firebird/2.0/data/ \
		legiar/firebird:2.0

## Misc

### Change password

	$ docker exec -it firebird /opt/firebird/bin/gsec -user sysdba -password masterkey -modify sysdba -pw newpassword

### Create backup

	$ docker exec -it firebird /opt/firebird/bin/gbak -b -t -v -user SYSDBA -password masterkey localhost:/var/lib/firebird/2.0/data/dbname.fdb /var/lib/firebird/2.0/backup/dbname.fbk

### Restore backup

	$ docker exec -it firebird /opt/firebird/bin/gbak -c -v -user SYSDBA -password masterkey /var/lib/firebird/2.0/backup/dbname.fbk localhost:/var/lib/firebird/2.0/data/dbname.fdb
