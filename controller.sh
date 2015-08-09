#!/bin/bash
set -x

# Install type includes: Controller | Network | Compute
export INSTALL_TYPE=Controller


# Install confirmation
read -p "Are you sure to install OpenStack Controller Node? [Y/N]"
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
inst_sql
inst_msgq

# Create environment scripts for further configurations
create_env_scripts

# Add controller node services (Identity, Image)
add_identity_service
add_image_service

# Setup compute service as controller node
add_compute
add_networking
create_init_network

# Add dashboard
add_dashboard

# Add telemetry service(ceilometer) and serve as a monitored node
add_ceilometer
