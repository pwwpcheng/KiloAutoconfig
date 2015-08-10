#!/bin/bash
set -x

# Install type includes: Controller | Network | Compute | Storage
export INSTALL_TYPE=Storage

# Install confirmation
read -p "Are you sure to install OpenStack Storage Node? [Y/N] " YN
if [ "$YN" != "Y" ] && [ "$YN" != "y" ]; then
	echo "Aborted."
	exit 1
fi

# define functions
[ -e ${PWD}/functions ] || exit 1 
source ${PWD}/export.env
. ${PWD}/functions

# Setup OpenStack Packages
set_hosts
inst_openstack
set_ntp

# Add Block Storage Service
add_block_storage

