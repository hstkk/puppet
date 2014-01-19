define ssh-server::authorized-key (
	$user = $title,
	$key,
	$type,
) {
	Ssh_authorized_key {
		ensure  => present,
		user    => $user,
		key     => $key,
		type    => $type,
		require => User[$user],
	}
}
