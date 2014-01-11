class raspberrypi {
	include raspberrypi::iptables

	User <| title == sami |> {
		groups  +> ['sudo', 'sshusers'],
		require => [Group['sshusers']],
	}

	exec { disable-root:
		command => 'passwd -l root',
	}

	user { 'pi':
		ensure     => 'absent',
		managehome => true,
		require    => User['sami'],
	}
}
