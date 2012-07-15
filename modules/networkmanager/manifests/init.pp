class networkmanager {
	$package = 'network-manager'

	service { $package:
		ensure => true,
		enable => true,
		require => Package[$package]
	}

	package { $package: }
}
