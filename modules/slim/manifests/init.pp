class slim {
	$package = 'slim'

        service { $package:
		ensure => true,
		enable => true,
                require => Package[$package],
        }

        package { $package: }

	file { '/etc/slim.conf':
		source  => 'puppet:///modules/slim/etc/slim.conf',
		require => Package[$package],
        }

}
