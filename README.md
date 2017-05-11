# collections-api-docker

Integration project that bootstraps a database server with the DINA Collections REST API

## Background

This project provides a way to start up the DINA-Web backbone - the DINA-Web Collections API REST web service v0 with the database and the KeyCloak component for managing users.

# Step by step instructions

## Install `docker`, `docker-compose`, `git` and `make`

Use instructions from <http://docs.docker.com/linux/started/> etc to install the above applications.

Example use of git to get this repo:

		mkdir ~/repos
		cd repos
		git clone git@github.com:DINA-Web/collections-api-docker.git
		cd collections-api-docker

## Running locally with SSL

Setting up service names is important when running locally or with the network cable unplugged.

Name resolution is needed, so that your laptop is known as for example "beta-api.dina-web.net".

It can be achieved in two ways. Either by running something like dnsdock or dnsmasq (the "proper" way, configuration steps are documented here: https://github.com/mskyttner/dns-test-docker).

Or you can try to edit /etc/host to add names, such as...

		sudo nano /etc/hosts
		# then add names like "beta-sso.dina-web.net" and "beta-api.dina-web.net"
		# if you are also running the Collections Manager UI, add "beta-cm.dina-web.net", too

... and then remember to revert the edit when you are done.

### SSL

For SSL to work properly, you need to check out `proxy-docker` and make sure your `.crt` and `.key` files are in the `certs` directory, then start the reverse proxy with `make` or `docker-compose up -d`. 

Read more about detailed steps in the proxy-docker repo.

## Managing services

The `Makefile` contains available targets or actions for managing the various services:

		# to initialize, build and start services		
		make 
		
		# to stop, remove and clean
		make clean

You can also perform actions separately beyond the above.

### Loading data

		# to load demo data
		make init

Various other maintenance operations which are not available in the Makefile might be required at times.

### Make a test request

A script is provided, `demo.sh`, which authenticates with the single-sign on server (KeyCloak), gets a token and uses `curl` to make a simple request to the REST API:

		# note that the script assumes self-signed SSL certificate being used
		# (--cacert /tmp/certs/ca.pem should be removed if using commercial certs)
		./demo.sh

### Manage the application server
	
To connect to Wildfly CLI, issue a command on the relevant running container:
	
		docker exec -it collectionsapidocker_as_1 /opt/jboss/wildfly/bin/jboss-cli.sh --connect

		# you can use the web admin ui with user "admin" and password "dina"
		firefox localhost:9991

## Manage the database

To connect to the database from the host:
	
		docker exec -it collectionsapidocker_db_1 mysql -u root -p -D dina_web -h 127.0.0.1
  	
To export data as .sql dumps. This can be done from the host, using the -B switch:
	 
	  	docker exec -it collectionsapidocker_db_1 \
			mysql -B -u root -ppassword12 -h 127.0.0.1 -D dina_web \
			-e "select * from [TABLE];" | pv > /shr/table.tsv

To load/dump databases or do other long running commands:

	  	# run long running cmd in a screen session
	  	screen
  	
	  	# be patient
	  	./long_running_cmd.sh
	  	# use Ctrl-C Ctrl-d to detach


# Improvements

Pls have a look, try it out, log any issues under this repo's Issues, or if you know the fix, submit your improvements :) 


