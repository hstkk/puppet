class slim {
	$package = 'slim'

        service { $package:
                ensure => running,
                require => Package[$package]
        }

        package { $package:
                ensure => installed
        }
}
