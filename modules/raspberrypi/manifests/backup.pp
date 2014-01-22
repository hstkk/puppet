define raspberrypi::backup (
	$src = $title,
	$dest = '/data/backup',
) {
	file { $dest:
		ensure => 'directory',
	}

	cron { "backup-${src}":
		command => "rsync --archive --delete ${src} ${dest} &> /dev/null",
		special => 'daily',
		require => [Package['rsync'], File[$src, $dest]],
	}
}
