node workstation {
	include apt_conf
	include ntp
	include dev
	include sami
}

node 'e2.local' inherits workstation {
	include e2
}

include puppet
