class dev {
	include dev::java

	$packages = [ 'fonts-inconsolata', 'git' ]
        package { $packages: }
}
