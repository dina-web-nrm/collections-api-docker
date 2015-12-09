# dw-collections

Integration project that bootstraps a database server with the DINA Collections REST API

## Background

This project provides a way to start up the DINA-Web backbone with the database and a couple of services required to provide the DINA Collections REST API v 0.

## Step by step instructions

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

Then start the docker containers defined in the `docker-compose.yml` file.

    	docker-compose up

For loading databases or other long running commands:

  	# run long running cmd in a screen session
  	screen
  	
  	# be patient
  	./long_running_cmd.sh
  	# use Ctrl-C Ctrl-d to detach

	
To connect to the database:

	# NB: if running docker on Mac OS X, networking may not allow 
	# using the below, if so, find ip with $(docker-machine ip dev-nfs)
	
	# connect from the host to the containerized mysql
	mysql -u root -p -D dina_web -h 127.0.0.1
  	
Export as a dump. This can be done either from the host, using the -B switch:

	# run from the host
  	mysql -B -u root -ppassword12 -h 127.0.0.1 -D dina_web -e "select * from [TABLE];" | pv > table.tsv

To connect to Wildfly CLI:
	
	docker exec -it dwcollections_dina-wildfly_1 /opt/jboss/wildfly/bin/jboss.cli.sh --connect



# Important

After starting with `docker-compose up`, load user data into `keycloak` with:

	./populate_user_db.sh

After starting with `docker-compose up`, load collections data into `dina-web` with:

	./populate_dina_web_db.sh


Pls have a look, and submit improvements :)
