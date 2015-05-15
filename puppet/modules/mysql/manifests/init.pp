# Install MySQL
# Kopiert vom github repo 'vagrantpress'
# TODO: Passwort fix definiert. Herausnehmen
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

  exec {"peopleplanning":
    unless => "mysql -uroot -p${password} peopleplanning",
    command => "mysql -uroot -p${password} -e 'create database peopleplanning'",
    require => Exec["Set MySQL server\'s root password"]
}

}
