# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

webserver_image=demo_docker

container=docker
#container=podman

#
.PHONY: help 

help:
	@echo "make help"
	@echo "      this message"
	@echo "==== Targets outside container ===="
	@echo ""
	@echo "make container_build"
	@echo ""
	@echo "make container_live"
	@echo ""
	@echo "make container"
	@echo ""

container: container_build container_live

container_build:
	$(container) build --platform linux/amd64 -t $(webserver_image) .

container_live:
	$(container) run -it --rm \
                -v `pwd`:/scratch -w /scratch/ \
                --user $$(id -u):$$(id -g) \
                $(webserver_image) /bin/bash

#EOF
