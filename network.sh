#!/bin/bash
set -x

# Install type includes: Controller | Network | Compute | Storage
export INSTALL_TYPE=Network

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

set_env


if ! [ -z "${INSTALL_CORE}" ]; then
        # Setup OpenStack Packages
        set_hosts
        inst_ntp
        inst_openstack

        # Setup compute service as network node
        add_networking
        create_init_network
fi


