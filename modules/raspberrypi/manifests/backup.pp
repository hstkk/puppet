define raspberrypi::backup (
	$src = $title,
	$dest = '/data/backup',
) {
	if ! defined(File[$dest]) {
		file { $dest:
			ensure => 'directory',
		}
	} ->

	if ! defined(Package['rsync']) {
		package['rsync']
	} ->

	cron { "backup-${src}":
		command => "rsync --archive --delete ${src} ${dest} &> /dev/null",
		special => 'daily',
		require => File[$src],
	}
}
