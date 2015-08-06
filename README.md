# KiloAutoconfig
Autoconfiguration scripts for OpenStack Kilo.
All configurations are written according to <b>OpenStack Installation Guide for Ubuntu 14.04</b>.

Before installation:
Configure export.env according to your need.
Set passwords and network interfaces (e.g. MANAGEMENT_INTERFACE=eth0)

Install: 
Controller Node: <code>bash controller.sh</code>
Network Node: <code>bash network.sh</code>
Compute Node: <code>bash compute.sh</code>

Basic environment
Identity service
Image service
Compute service
Network (OpenStack Networking (neutron))
Dashboard
Telemetry module

----------------------
Currently supported modules:

