class raspberrypi {
	include raspberrypi::sami
	include raspberrypi::git

        File <| title == '/etc/iptables.up.rules' |> {
                source => 'puppet:///modules/raspberrypi/etc/iptables.up.rules',
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

	mount { '/data':
		device  => 'LABEL=backup',
		fstype  => 'auto',
		ensure  => 'mounted',
		options => 'defaults,noatime,nodiratime',
		atboot  => 'true',
	}

	raspberrypi::user { ['koti', 'anna']: }

	raspberrypi::backup { ['/home/git', '/home/sami/logs']: }
}
