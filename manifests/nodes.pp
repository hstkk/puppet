node workstation {
	include apt_conf
	include ntp
	include dev
}

node 'e2.local' inherits workstation {
	include e2
}

include puppet
