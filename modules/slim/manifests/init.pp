class slim {
	$package = 'slim'

        service { $package:
                ensure => running,
                require => Package[$package]
        }

        package { $package:
                ensure => installed
        }

	file { '/etc/slim.conf':
		ensure  => file,
		source  => 'puppet:///modules/slim/etc/slim.conf',
		owner   => 'root',
		group   => 'root',
		mode    => '0444',
		require => Package[$package]
        }

}
