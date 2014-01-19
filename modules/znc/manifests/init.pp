class znc {
	$user = 'znc'

	package { 'znc': }

	user { $user:
		ensure     => present,
		shell      => '/bin/false',
		managehome => true,
	}

	file { ["/home/${user}/.znc", "/home/${user}/.znc/configs"]:
		ensure  => 'directory',
		owner   => $user,
		require => User[$user],
	}

	file { "/home/${user}/.znc/configs/znc.conf":
		owner   => $user,
		mode    => 0600,
		source  => "puppet:///modules/znc/home/${user}/.znc/configs/znc.conf",
		require => [User[$user], File["/home/${user}/.znc/configs"]],
	}

	cron { 'znc':
		command => 'znc',
		user    => $user,
		special => 'reboot',
		require => [Package['znc'], File["/home/${user}/.znc/configs/znc.conf"]]
	}
}
