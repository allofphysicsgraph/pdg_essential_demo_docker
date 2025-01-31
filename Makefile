# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

webserver_image=demo_docker

container=docker
#container=podman

#
.PHONY: help docker

help:
	@echo "make help"
	@echo "      this message"
	@echo "==== Targets outside container ===="
	@echo ""
	@echo "make up"
	@echo "      build and run $(container)"
	@echo ""
	@echo "make container_build"
	@echo ""
	@echo "make container_live"
	@echo ""
	@echo "make container"
	@echo ""

# create and start the webserver. This will build the Docker image if that's needed
up:
	$(container) ps
	if [ `$(container) ps | wc -l` -gt 1 ]; then \
	       	$(container) kill $$($(container) ps -q); \
		fi
	$(container) ps


container: container_build container_live

# https://docs.docker.com/build/building/multi-platform/
container_build:
	$(container) build --platform linux/amd64 -t $(webserver_image) .

container_live:
	$(container) run -it --rm \
                -v `pwd`:/scratch -w /scratch/ \
                --user $$(id -u):$$(id -g) \
                $(webserver_image) /bin/bash


#EOF
