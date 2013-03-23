class sami {
	user { 'sami':
		ensure => present,
	}

	File {
		owner  => 'sami',
		group  => 'sami',
		mode   => 600,
	}

	file { '/home/sami/.gitconfig':
		source => 'puppet:///modules/sami/home/sami/.gitconfig',
	}

	file { '/home/sami/.ssh':
		ensure => 'directory',
	}

        file { '/home/sami/.ssh/config':
		source => 'puppet:///modules/sami/home/sami/.ssh/config',
        }

	file { '/home/sami/projects':
		ensure => 'directory',
	}
}
