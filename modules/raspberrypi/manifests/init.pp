class raspberrypi {

        File <| title == '/etc/iptables.up.rules' |> {
                source => 'puppet:///modules/raspberrypi/etc/iptables.up.rules',
        }

	User <| title == sami |> {
		groups  +> ['sudo', 'sshusers', 'smbusers'],
		require => Group[['sshusers', 'smbusers']],
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
