# Demo of Docker

The repo contains a `Dockerfile` and a `Makefile`. 
The `Makefile` builds a Docker image and then runs the Docker container.

Everything else in the Physics Derivation Graph relies on these two capabilities.

To use,
```bash
make container
```
which puts you inside a Docker container.

# Guide

This demo repo is part of a sequence of tutorials

![sequence of demos](https://raw.githubusercontent.com/allofphysicsgraph/pdg_essential_demo_docker/refs/heads/main/tutorials_dependency_graph.svg)



# setting up `git` on a freshly initialized VPS

generate a key pair
```
ssh-keygen -t ed25519 -C "YOUREMAILADDRESSHERE@DOMAIN.COM"
```
get content of public key
```
cat ~/.ssh/id_ed25519.pub
```

In a browser visit <https://github.com/settings/keys>

Once the public key is uploaded, validate access using
```
ssh -T git@github.com
```
which should yield
```
Hi USERNAMEHERE! You've successfully authenticated, but GitHub does not provide shell access.
```

Commits need an author name and email
```
git config --global user.email "YOUREMAILADDRESSHERE@DOMAIN.COM"
git config --global user.name "FIRSTNAME LASTNAME"
```
