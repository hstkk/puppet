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
		key => 'AAAAB3NzaC1yc2EAAAABJQAAAQEArHIW98FxWuGJCz5WHw89w01iYlNYZo2SNR6Uf2LiKuCbhNyBLLXoFjmcETNpB8CKqhv+ejWn+mxmBhT/4qcIQ/q4uR9QasnIqOn4dWcQBdZ/4bUvBEbGL10zmqXQU+KOQ3DmUbtIAKSvbHNJLtkCQEqXOzmxIND2OphUHci57L+ui8crsuxtPscPAg9SC7e6ADErjYYWphL8lElYtLwGCDWRkJGD8X+OwO6IsN4stAG/+Pgz9Baf3JPXi2Jf8u4UDjptgKzhVW5TlWUWIXlJ3/rKwhw7xB8edP445ueAon5Tvha3q6m/w2wllPNiI2QDBfBbQgGb1TCyc6Md2o4OCw==',
	}
	
	ssh_authorized_key { 'nexus7':
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCvc8BuKIb7/Sj/vqoqXK+tb4amiqxRNOZNxqRaid37eXoWMugY9vntznVUbAQZ6amlQBKG/dndDIIBUxXE3Fc7alXowPbQ+B3uwIHeGo+zTSTnbOLCYjXbMf5cMPsXJ+qBwOJLJbTWoU4IInpnLNAfnX9G/PsHgGhIn9abfHD2EYWtLzJA39vcX+TCLCrSZEqZG7znGLH7IDtd+27PsyyIKLNZ+AUHy8gicnutswrXweXRCnsS7pxe2zdtUikYlr8hCCCE+qjD/IyGZ88daA5C853HbhIsor+wVSzq6wbFPLmbre0z4YYr2RUTcSaWnjau9GZscQGye9vkbtboJHs7',
	}
}
