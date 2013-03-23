class desktop::zsh {
	$package = 'zsh'

	package { $package: }

	exec { 'chsh -s $(which zsh) sami':
		require  => Package[$package],
	}
}
