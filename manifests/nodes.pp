node workstation {
	include apt_conf
	include ntp
	include init
	include iptables
	include dev
	include sami
	include desktop
}

node 'e2.local' inherits workstation {
	include e2
}

include puppet
