class iptables {
	$package = 'iptables'
	package { $package: }

	File {
		require => Package[$package],
	}

	file { '/etc/network/if-pre-up.d/iptables':
		mode   => 500,
		source => 'puppet:///modules/iptables/etc/network/if-pre-up.d/iptables',
	}

        file { '/etc/iptables.up.rules':
                source => 'puppet:///modules/iptables/etc/iptables.up.rules',
        }

}
