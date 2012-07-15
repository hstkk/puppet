class slim {
	$package = 'slim'

        service { $package:
                ensure => running,
                require => Package[$package],
        }

        package { $package: }

	file { '/etc/slim.conf':
		source  => 'puppet:///modules/slim/etc/slim.conf',
		require => Package[$package],
        }

}
