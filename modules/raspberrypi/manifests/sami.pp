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
}
