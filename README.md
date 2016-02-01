# dw-collections

Integration project that bootstraps a database server with the DINA Collections REST API

## Background

This project provides a way to start up the DINA-Web backbone - the DINA-Web Collections API REST web service v0 with the database and the KeyCloak component for managing users.

# Step by step instructions

## Install `docker`, `docker-compose` and `git`

First get docker as per instructions at <http://docs.docker.com/linux/started/> or <http://docs.docker.com/windows/started/> or <http://docs.docker.com/mac/started/>, depending on the platform OS on the host.

		# if on linux (use installers on Win or Mac)
		wget -qO- https://get.docker.com/ | sh

		# get docker-compose
		sudo -i
		curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose	
		exit

		# add your user to the docker group so you can run docker without sudo
		sudo usermod -aG docker my_user_name

		# restart docker service
		sudo service docker restart

Then use git to install this repo

		mkdir ~/repos
		cd repos
		git clone git@github.com:DINA-Web/dw-collections.git
		cd dw-collections

## Load data

Before starting the services, load user data into `keycloak` with:

		./populate_keycloak_db.sh

Then load collections data into `dina-web` with:

		./populate_dina_web_db.sh

NB: The loading of data above is through db dumps which may require specific versions of Keycloak (1.6.1 Final) and MySQL...

## Start the system services

Then start services defined in the `docker-compose.yml` file.

	    	docker-compose up dina-mysql
		# wait till done, press Ctrl-Z then issue "bg" to run it in the background

		docker-compose up dina-keycloak

		# ... Ctrl-Z + "bg"

		docker-compose up dina-wildfly

		# ... Ctrl-Z + "bg"

# GOTCHAs

- If you have an existing mysql running on 3306, stop it. Or edit the `docker-compose.yml` and change the db port used there everywhere...
- On Mac, you need to setup `docker-machine`, with a case-sensitive filesystem. Don't remember the exact steps, but this could have been [one](https://github.com/adlogix/docker-machine-nfs).
- If you are on a network that blocks DNS traffic you might need to reconfigure the docker daemon to use other nameservers:

		sudo nano /etc/default/docker
		# add a line like this to use your network's required DNS servers
		DOCKER_OPTS="--dns 172.16.0.7 --dns 172.16.0.9 --dns 172.16.0.23"
		# then save and exit and restart docker for this to take effect
		sudo service docker restart

# Maintenance operations

## Manage the application server
	
To connect to Wildfly CLI, issue a command on the relevant running container:
	
		docker exec -it dwcollections_dina-wildfly_1 /opt/jboss/wildfly/bin/jboss-cli.sh --connect

		# you can use the web admin ui with user "admin" and password "dina"
		firefox localhost:9991

## Manage the database

To connect to the database from the host:

		# NB: if running docker on Mac OS X, networking may not allow 
		# using the below, if so, find ip with IP=$(docker-machine ip dev-nfs)
	
		# connect from the host to the containerized mysql
		mysql -u root -p -D dina_web -h 127.0.0.1
  	
To export data as .sql dumps. This can be done from the host, using the -B switch:

		# run from the host
	  	mysql -B -u root -ppassword12 -h 127.0.0.1 -D dina_web -e "select * from [TABLE];" | pv > table.tsv

To load/dump databases or do other long running commands:

	  	# run long running cmd in a screen session
	  	screen
  	
	  	# be patient
	  	./long_running_cmd.sh
	  	# use Ctrl-C Ctrl-d to detach


# Improvements

Pls have a look, try it out, log any issues under this repo's Issues, or if you know the fix, submit your improvements :) 


