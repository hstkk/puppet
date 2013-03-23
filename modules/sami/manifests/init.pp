class sami {
	$user = 'sami'

	user { $user:
		ensure  => present,
		shell   => '/usr/bin/zsh',
		require => Package['zsh'],
	}

	File {
		owner  => 'sami',
		group  => 'sami',
		mode   => 600,
	}

	file { '/home/sami/.gitconfig':
		source  => 'puppet:///modules/sami/home/sami/.gitconfig',
		require => User[$user],
	}

	file { '/home/sami/.ssh':
		ensure  => 'directory',
		require => User[$user],
	}

        file { '/home/sami/.ssh/config':
		source  => 'puppet:///modules/sami/home/sami/.ssh/config',
		require => User[$user],
        }

	file { '/home/sami/projects':
		ensure  => 'directory',
		require => User[$user],
	}
}
