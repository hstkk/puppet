class git-server {
	$package = 'git-core'

	user { 'git':
		ensure     => present,
		shell      => '/usr/bin/git-shell',
		groups     => ['sshusers'],
		managehome => true,
		require    => [Group['sshusers'], Package[$package]],
	}

        package { $package: }

	include git-server::repos
}
