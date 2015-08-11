#!/bin/bash
set -x

# Install type includes: Controller | Network | Compute
export INSTALL_TYPE=Controller

# Install confirmation
read -p "Are you sure to install OpenStack Controller Node? [Y/N] " YN
if [ "$YN" != "Y" ] && [ "$YN" != "y" ]; then
	echo "Aborted."
	exit 1
fi

# define functions
[ -e ${PWD}/functions ] || exit 1 
. ${PWD}/functions

set_env

# Install OpenStack core services
if ! [ -z "${INSTALL_CORE}" ]; then
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
fi

# Add telemetry service(ceilometer) and serve as a monitor
! [ -z "${INSTALL_TELEMETRY}" ] && add_telemetry

# Add Block Storage Service
! [ -z "${INSTALL_BLOCK_STORAGE}" ] && add_block_storage

# Add OpenStack Orchestration (Heat)
! [ -z "${INSTALL_ORCHESTRATION}" ] && add_orchestration
