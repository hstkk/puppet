node workstation {
	include sudo
	include networkmanager
	include xfce
	include slim
	include openoffice
}

node 'e2.local' inherits workstation {
	include e2::iwlwifi
}
