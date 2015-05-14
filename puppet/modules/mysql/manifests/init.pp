# Install MySQL
# Kopiert vom github repo 'vagrantpress'
# TODO: Passwort fix installiert
class mysql::install {

  $password = 'nath'

  package { [
      'mysql-client',
      'mysql-server',
    ]:
    ensure => installed,
  }

  exec { 'Set MySQL server\'s root password':
    subscribe   => [
      Package['mysql-server'],
      Package['mysql-client'],
    ],
    refreshonly => true,
    unless      => "mysqladmin -uroot -p${password} status",
    command     => "mysqladmin -uroot password ${password}",
  }

}
