node workstation {
	include iptables
	include desktop
	include dev
	include tmux
	include zsh
	include sami
}

node server {
	include ntp
	include ssh-server
	include git-server
	include tmux
	include zsh
	include sami
}

node 'e2' inherits workstation {
	include e2
}

node 'raspberrypi' inherits server {
	include raspberrypi
}

