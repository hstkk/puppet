class e2 {
	file { '/etc/lightdm/lightdm.conf':
		source => 'puppet:///modules/e2/etc/lightdm/lightdm.conf',
	}
}
