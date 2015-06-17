# Install Apache

class my_apache2::install {

#  # Installiert apache2 unter /usr/sbin/apache2 (2.4.7)
#  # Konfig: /etc/apache2/apache2.conf
#  package { [
#      'apache2',
#    ]:
#    ensure => installed,
#  }
#
#  service{
#    "apache2":
#      ensure => true,
#      enable => true
#  }
#
#  file {
#    "/etc/apache2/apache2.conf":
#      source => "puppet:///modules/apache2/apache2.conf",
#      mode => 644,
#      owner => root,
#      group => root
#  }
#
#  file {
#    "/etc/apache2/sites-available/planik.conf":
#      source => "puppet:///modules/apache2/rack_example.conf",
#      mode => 644,
#      owner => root,
#      group => root
#  }
#
#  file { '/etc/apache2/sites-enabled/planik.conf':
#    ensure => 'link',
#    target => '/etc/apache2/sites-available/planik.conf',
#  }
#
#  exec { 'remove_default_conf_in_sites-enabled':
#    command => "sudo rm 000-default.conf",
#    cwd     => "/etc/apache2/sites-enabled",
#    onlyif  => "test -f /etc/apache2/sites-enabled/000-default.conf",
#    # notify  => Notify['/etc/apache2/sites-enabled not found'],
#  }
#
#  # TODO Web Port anpassen

}
