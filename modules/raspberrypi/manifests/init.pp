class raspberrypi {
	include raspberrypi::iptables

	user { 'sami':
		groups => ['sudo', 'sshusers'],
	}
}
