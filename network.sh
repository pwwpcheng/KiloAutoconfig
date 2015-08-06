#!/bin/bash
set -x

# Install type includes: Controller | Network | Compute
export INSTALL_TYPE=Network

# define functions
[ -e ${PWD}/functions ] || exit 1 
. ${PWD}/functions

# Import environment variables
set_env()

# Setup OpenStack Packages
set_hosts
inst_ntp
inst_openstack

# Setup compute service as network node
add_networking

# Create a initial network