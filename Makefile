# Configure these:
DOCKER := "/usr/bin/docker.io"  # Using Ubuntu 14.04's docker.io package
# End of user configuration.

IMAGE := srid/wanderlust
CONTAINER := wanderlust
PWD := $(shell pwd)
RUNARGS := -v ${PWD}/data:/data:rw 

all:
	sudo ${DOCKER} build -t ${IMAGE} .

run:	stop prepare
	sudo ${DOCKER} run -t -i --name ${CONTAINER} ${RUNARGS} ${IMAGE}

stop:
	sudo ${DOCKER} kill ${CONTAINER} || true
	sudo ${DOCKER} rm -v ${CONTAINER} || true

prepare:
	mkdir -p data/.elmo

# inspect the image
shell:
	sudo ${DOCKER} run --rm --name ${CONTAINER}_shell -t -i ${RUNARGS} ${IMAGE} bash


clean:
	sudo ${DOCKER} rmi ${IMAGE}

clean_data:
	sudo rm -rf ./data
	mkdir data
	touch data/.gitkeep
