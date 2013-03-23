class raspberrypi {
	include raspberrypi::iptables

	user { 'sami':
		groups  => ['sudo', 'sshusers'],
		require => [Group['sshusers'], User['sami']],
	}

	exec { disable-root:
		command => 'passwd -l root',
	}
}
