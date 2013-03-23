node workstation {
	include iptables
	include desktop
	include dev
	include sami
}

node 'e2' inherits workstation {
	include e2
}

