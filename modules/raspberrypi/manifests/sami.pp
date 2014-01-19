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

	$users = ['sami', 'git']
	ssh_authorized_key { 'sami':
		ensure  => present,
		user    => $users,
		key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCnhZ7QF5UeQ94eCresZw9OHGtpLRKLYUsQYrgJOQQk3MdVj1h3ofu5F5reFxigjzk+0H60YzjkgCJDg1xK93yaP66JfEweprPfEegc9UAJnWnjU6GbE3NpLwZSU/QoXShK2TunNUbrOUr25U/gCLVe2tdKIU1dDKtHRDrQ6vbzqtKTz+zq0JIFI1fkZzvIyMISH8qFayQbXmgS6m8Zvn/S0oScpRToTgLiqs0rSLtT2sXH5YsJjBC7yenCHo5FclwAw1T6r2NHHfHoSJqSKcCmTCfHgPfl6EfPvDarLVoOeTlY8//PnWh3/uTMq7xfX7Ts5BsDKmBvTCVCX1k91Pcx',
		type    => 'ssh-rsa',
		require => User[$users],
	}
}
