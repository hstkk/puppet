define raspberrypi::user (
    $user = $title,
) {
	$home = '/data/samba/home'

	user { $user:
		ensure     => present,
		shell      => '/bin/false',
		home       => "${home}/${user}",
		managehome => true,
		require    => File[$home],
	}
}
