class raspberrypi {
	include raspberrypi::iptables

	user { 'sami':
		groups => ['sudo', 'sshusers'],
	}

	exec { disable-root:
		command => 'passwd -l root',
	}
}
