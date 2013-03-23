class git-server {
	$package = 'git-core'

	user { 'git':
		ensure     => present,
		shell      => '/usr/bin/git-shell',
		groups     => ['sshusers'],
		managehome => true,
		require    => [Group['sshusers'], Package[$package]],
	}

	file { '/home/git/.ssh':
		ensure  => 'directory',
		owner   => 'git',
		group   => 'git',
		require => User['git'],
	}

        package { $package: }
}
