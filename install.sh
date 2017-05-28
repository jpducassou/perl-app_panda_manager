#!/bin/bash

_pwd=$(pwd)
_workdir=/home/dancer

docker run -it --rm \
	-e "https_proxy=${https_proxy}" \
	-e "http_proxy=${http_proxy}"   \
	-v "${pwd}/.perlbrew:${_workdir}/.perlbrew" \
	-v "${pwd}/.cpanm:${_workdir}/.cpanm" \
	-v "${pwd}/.local:${_workdir}/.local" \
	panda "${_workdir}/install_deps"

