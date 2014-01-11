class sami {
	$user = 'sami'

	@user { $user:
		ensure     => present,
		shell      => '/usr/bin/zsh',
		managehome => true,
		require    => Package['zsh'],
	}

	File {
		owner  => 'sami',
		group  => 'sami',
		mode   => 600,
	}

	file { '/home/sami/.ssh':
		ensure  => 'directory',
		require => User[$user],
	}

	file { '/home/sami/projects':
		ensure  => 'directory',
		require => User[$user],
	}
}
