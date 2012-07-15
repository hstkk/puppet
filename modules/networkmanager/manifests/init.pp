class networkmanager {
	$package = 'network-manager'

	service { $package:
		ensure => running,
		require => Package[$package]
	}

	package { $package: }
}
