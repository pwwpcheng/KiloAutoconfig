#!/bin/bash
set -x

# Install confirmation
read -p "Are you sure to configure network node on a compute node? [Y/N] " YN
if [ "$YN" != "Y" ] && [ "$YN" != "y" ]; then
	echo "Aborted."
	exit 1
fi

# define functions
[ -e ${PWD}/functions ] || exit 1 
source ${PWD}/export.env
. ${PWD}/functions

set_env

add_network_on_compute