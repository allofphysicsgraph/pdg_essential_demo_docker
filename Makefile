# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com

# Get the machine architecture.
# On arm64 (Apple Silicon M1/M2/etc.), `uname -m` outputs "arm64".
# On amd64 (Intel), `uname -m` outputs "x86_64".
ARCH := $(shell uname -m)

ifeq ($(ARCH), arm64)
        this_arch=arm64
else ifeq ($(ARCH), x86_64)
        this_arch=amd64
else
        @echo "Unknown architecture: $(ARCH). Cannot determine if Mac is new or old."
endif

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
	if (! $(container) stats --no-stream ); then  open /Applications/Docker.app; while (! $(container) stats --no-stream ); do    echo "Waiting for Docker to launch...";  sleep 1; done; fi;
	$(container) build -t $(webserver_image) .

container_live:
	$(container) run -it --rm \
                -v `pwd`:/scratch -w /scratch/ \
                --user $$(id -u):$$(id -g) \
                $(webserver_image) /bin/bash

#EOF
