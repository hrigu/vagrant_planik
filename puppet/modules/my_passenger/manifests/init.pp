# Install passenger


# Installiert anscheinend mod-passenger und erstellt eine Konfiguration
# mods-enabled passenger.load
# mods-enabled passenger.conf
#
# dpkg -l | grep passenger
#ii  libapache2-mod-passenger         4.0.37-2 amd64        Rails and Rack support for Apache2
#ii  ruby-passenger                   4.0.37-2 amd64        Rails and Rack support

class my_passenger::install {

	package { 'libapache2-mod-passenger':
	ensure => present,
	}

	# Rack ist nötig, damit ein rack_example läuft
	package { 'rack':
		ensure   => 'installed',
		provider => 'gem',
	}

}
