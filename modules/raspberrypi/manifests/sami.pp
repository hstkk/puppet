class raspberrypi::sami {
	User <| title == sami |> {
		groups  +> ['sudo', 'sshusers', 'smbusers'],
		require => Group[['sshusers', 'smbusers']],
	}

	file { '/data/samba/home/sami':
		ensure  => 'directory',
		owner   => 'sami',
		mode    => 700,
		require => [File['/data/samba/home'], User['sami']],
	}

	irssi::autostart { 'sami': }

	Ssh_authorized_key {
		ensure  => present,
		type    => 'ssh-rsa',
		user    => 'sami',
		options => 'command="tmux has-session && exec tmux attach || exec tmux"',
		require => [User['sami'], Package['tmux']],
	}

	ssh_authorized_key { 'one':
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCnhZ7QF5UeQ94eCresZw9OHGtpLRKLYUsQYrgJOQQk3MdVj1h3ofu5F5reFxigjzk+0H60YzjkgCJDg1xK93yaP66JfEweprPfEegc9UAJnWnjU6GbE3NpLwZSU/QoXShK2TunNUbrOUr25U/gCLVe2tdKIU1dDKtHRDrQ6vbzqtKTz+zq0JIFI1fkZzvIyMISH8qFayQbXmgS6m8Zvn/S0oScpRToTgLiqs0rSLtT2sXH5YsJjBC7yenCHo5FclwAw1T6r2NHHfHoSJqSKcCmTCfHgPfl6EfPvDarLVoOeTlY8//PnWh3/uTMq7xfX7Ts5BsDKmBvTCVCX1k91Pcx',
	}

	ssh_authorized_key { 'pro':
		key => 'AAAAB3NzaC1yc2EAAAABJQAAAQEApueh4QpzDy6m3Nd8zfdEw1t3I4BwOZLKAh3O 6lodUflZDZ2kc3b+j21+mniMEGeWjjqvsfNeaBZZrnADuDyC7zNdyT+uEUaEcwBb QPKmn2NjCHHuNECbGvLXygv2TrWifiIYxjnONmInseICX3UYE7F6tdhy+aaWUxO1 WrRzEJpqCDAbwMsNQFewUzAaFtK+ssODdUJNfNMy7I98VMmBEKaUMGxjCls7vkIJ bs8lJC30sRw3Aogavbl33VrcpA2j+bQMcVqn4m8oSgf2Ay923VITw+rHFetyXfKu qv9sudVXBv4FcY/ou9OL0gJoQKW1IE3jOnDkxBqRqK08HE0WZw==',
	}
}
