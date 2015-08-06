# KiloAutoconfig
Autoconfiguration scripts for OpenStack Kilo.
All configurations are written according to <b>OpenStack Installation Guide for Ubuntu 14.04</b>.

-------
Before installation:<p>
Configure export.env according to your need.<p>
Set passwords and network interfaces (e.g. MANAGEMENT_INTERFACE=eth0)<p>


Install: <p>
Controller Node: <code>bash controller.sh</code><p>
Network Node: <code>bash network.sh</code><p>
Compute Node: <code>bash compute.sh</code><p>

----------------------
Currently supported modules:

	Basic environment
	Identity service
	Image service
	Compute service
	Network (OpenStack Networking (neutron))
	Dashboard
	Telemetry module
