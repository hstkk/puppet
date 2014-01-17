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

	class { 'network::interfaces':
		interfaces => {
			'eth0' => {
				'method' => 'static',
				'address' => '192.168.1.254',
				'netmask' => '255.255.255.0',
				'gateway' => '192.168.1.1',
			}
		},
		auto => ['eth0'],
	}
}
