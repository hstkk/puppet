node workstation {
	include apt_conf
	include puppet
	include init
	include sudo
	include networkmanager
	include xfce
	include slim
	include openoffice
	include iceweasel
}

node 'e2.local' inherits workstation {
	include e2::iwlwifi
}
