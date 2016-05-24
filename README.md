# dw-collections

Integration project that bootstraps a database server with the DINA Collections REST API

## Background

This project provides a way to start up the DINA-Web backbone - the DINA-Web Collections API REST web service v0 with the database and the KeyCloak component for managing users.

# Step by step instructions

## Install `docker`, `docker-compose`, `git` and `make`

Use instructions from <http://docs.docker.com/linux/started/> etc to install the above applications.

Example use of git to get this repo:

		mkdir ~/repos
		cd repos
		git clone git@github.com:DINA-Web/dw-collections.git
		cd dw-collections

## Setting up service names

You may also need to set up name resolution. If running locally, you can edit /etc/host to add names, such as
		sudo nano /etc/hosts
		# then add names like "beta-sso.dina-web.net" and "beta-api.dina-web.net"

## SSL

For SSL to work properly, you need to check out `dw-proxy` and make sure your `.crt` and `.key` files are in the `certs` directory, then start the reverse proxy with `make`.

## Managing services

The `Makefile` contains available targets or actions for managing the various services:

		# to initialize, build and start services		
		make 
		
		# to stop, remove and clean
		make clean

You can also perform actions separately beyond the above.

### Loading Collections data in a separate step:

		# to load Specify6/7 demo data
		make images-import

		# to load DINA-Web sample data
		make collections-import

		# to add a "reporter" user and use it to fetch data from the API
		make reporter-import
		make reporter-test

Various other maintenance operations which are not available in the Makefile might be required at times.

### Manage the application server
	
To connect to Wildfly CLI, issue a command on the relevant running container:
	
		docker exec -it dwcollections_dina-wildfly_1 /opt/jboss/wildfly/bin/jboss-cli.sh --connect

		# you can use the web admin ui with user "admin" and password "dina"
		firefox localhost:9991

## Manage the database

To connect to the database from the host:
	
		# connect from the host to the containerized mysql
		mysql -u root -p -D dina_web -h 127.0.0.1
  	
To export data as .sql dumps. This can be done from the host, using the -B switch:

		# run from the host
	  	mysql -B -u root -ppassword12 -h 127.0.0.1 -D dina_web -e "select * from [TABLE];" | pv > /shr/table.tsv

To load/dump databases or do other long running commands:

	  	# run long running cmd in a screen session
	  	screen
  	
	  	# be patient
	  	./long_running_cmd.sh
	  	# use Ctrl-C Ctrl-d to detach


# Improvements

Pls have a look, try it out, log any issues under this repo's Issues, or if you know the fix, submit your improvements :) 


