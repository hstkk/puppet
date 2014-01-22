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
		key     => ['AAAAB3NzaC1yc2EAAAADAQABAAABAQCnhZ7QF5UeQ94eCresZw9OHGtpLRKLYUsQYrgJOQQk3MdVj1h3ofu5F5reFxigjzk+0H60YzjkgCJDg1xK93yaP66JfEweprPfEegc9UAJnWnjU6GbE3NpLwZSU/QoXShK2TunNUbrOUr25U/gCLVe2tdKIU1dDKtHRDrQ6vbzqtKTz+zq0JIFI1fkZzvIyMISH8qFayQbXmgS6m8Zvn/S0oScpRToTgLiqs0rSLtT2sXH5YsJjBC7yenCHo5FclwAw1T6r2NHHfHoSJqSKcCmTCfHgPfl6EfPvDarLVoOeTlY8//PnWh3/uTMq7xfX7Ts5BsDKmBvTCVCX1k91Pcx', 'AAAB3NzaC1yc2EAAAABJQAAAQEApueh4QpzDy6m3Nd8zfdEw1t3I4BwOZLKAh3O6lodUflZDZ2kc3b+j21+mniMEGeWjjqvsfNeaBZZrnADuDyC7zNdyT+uEUaEcwBbQPKmn2NjCHHuNECbGvLXygv2TrWifiIYxjnONmInseICX3UYE7F6tdhy+aaWUxO1WrRzEJpqCDAbwMsNQFewUzAaFtK+ssODdUJNfNMy7I98VMmBEKaUMGxjCls7vkIJbs8lJC30sRw3Aogavbl33VrcpA2j+bQMcVqn4m8oSgf2Ay923VITw+rHFetyXfKuqv9sudVXBv4FcY/ou9OL0gJoQKW1IE3jOnDkxBqRqK08HE0WZw==', 'AAAAB3NzaC1yc2EAAAABIwAAAQEAuPvtpArbSMtiUr//upPeHky7VG29yFbP8chQAAaWo6rW1Gwxl4ZjZpsxhZKX1xEI3HAXCCwYW9cROL+BVmVVi1YohyCcROpQkloG5mqe+NLkk57+Ed8nWWHpqiEBspVO4v7/bdzQhdAHKNkF45IztyU/IdX/LfIK2RE7YfqlKG0OYtdo3aeCK8TBZuZSsqN/ASfJtV6iouWG6HWX9Q8nZZizi7UCT1WBg7j8vmSv2J5y2SgBRts1VH4CicyyfGPKdFnfLRsFz8UxZORMv6u9qPhys1lnOfNDjpaqv0ETHbp1TXQ7Vj73WPxESIqPPNkidX4o30yUTcmFfkW9swQgeQ=='],
		type    => 'ssh-rsa',
	}

	ssh_authorized_key { 'sami':
		user    => 'sami',
		options => 'command="tmux has-session && exec tmux attach || exec tmux"',
		require => [User['sami'], Package['tmux']],
	}

	ssh_authorized_key { 'git':
		user    => 'git',
		require => User['git'],
	}
}
