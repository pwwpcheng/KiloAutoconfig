#!/bin/bash
set -x

# Install type includes: Controller | Network | Compute
export INSTALL_TYPE=Compute

# Install confirmation
read -p "Are you sure to install OpenStack Compute Node? [Y/N] " YN
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

# Create environment scripts for further configurations
create_env_scripts

# Setup compute service as a compute node
add_compute
add_networking

# Add telemetry service(ceilometer) and serve as a monitored node
add_ceilometer
