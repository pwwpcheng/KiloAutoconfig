#!/bin/bash
set -x

# Install type includes: Controller | Network | Compute
export INSTALL_TYPE=Network

# Install confirmation
read -p "Are you sure to install OpenStack Network Node? [Y/N]"
if [ "$YN" != "Y" && "$YN" != "y" ]; then
	echo "Aborted."
	exit 1
fi

# define functions
[ -e ${PWD}/functions ] || exit 1 
. ${PWD}/functions

# Import environment variables
set_env
set_hosts

# Setup OpenStack Packages
set_hosts
inst_ntp
inst_openstack

# Setup compute service as network node
add_networking

# Create a initial network

