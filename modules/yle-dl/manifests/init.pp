class yle-dl {
	$file = '/usr/local/bin/yle-dl'

	package { ['rtmpdump', 'python-crypto']: } ->

	exec { "wget -qO ${file} https://raw.github.com/aajanki/yle-dl/master/yle-dl": 
		creates => $file,
	} ->

	file { $file:
		mode =>0755,
	}
}
