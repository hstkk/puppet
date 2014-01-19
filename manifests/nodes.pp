node default {
	include iptables
	include zsh
	include tmux
	include sami
}

node workstation inherits default {
	include desktop
}

node server inherits default {
	include ssh-server
	include git-server
	include samba-server
	include irssi
	include raspberrypi
}

node 'raspberrypi' inherits server {
}

