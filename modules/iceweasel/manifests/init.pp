class iceweasel {

	$file = '/tmp/pkg-mozilla-archive-keyring_1.0_all.deb'
	exec { 'wget -O ' + $file + ' http://mozilla.debian.net/pkg-mozilla-archive-keyring_1.0_all.deb': }
	exec { 'dpkg --install ' + $file: }
	exec { 'rm ' + $file: }
	exec { 'apt-get install -t ' + $distro + 'squeeze-backports iceweasel': }
}
