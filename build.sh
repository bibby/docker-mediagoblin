#!/bin/bash
here=$(dirname "${BASH_SOURCE[0]}")
cache=
[ "$1" == "init" ] && {
	cache="--no-cache "
	docker pull ubuntu:trusty
}

docker build ${cache}-t bbby/mediagoblin -f "$here/mediagoblin.docker" "$here"
