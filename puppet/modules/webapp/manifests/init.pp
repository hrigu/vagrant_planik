# Install Apache

class webapp::install {

  file { "/home/vagrant/web_root":
    ensure => "directory",
  }

  file { "/home/vagrant/web_root/www":
    ensure => "directory",
  }

  file {
    "/home/vagrant/web_root/www/index.html":
      source => "puppet:///modules/webapp/index.html",
  }
  file {
    "/home/vagrant/web_root/www/test.php":
      source => "puppet:///modules/webapp/test.php",
  }
}

class webapp::install_rack_example {

  file { "/home/vagrant/web_root":
    ensure => "directory",
  }

  file { "/home/vagrant/web_root/rack_example":
    ensure => "directory",
  }
  file { "/home/vagrant/web_root/rack_example/public":
    ensure => "directory",
  }

  file { "/home/vagrant/web_root/rack_example/tmp":
    ensure => "directory",
  }

  file {
    "/home/vagrant/web_root/rack_example/config.ru":
      source => "puppet:///modules/webapp/rack_example/config.ru",
  }

}

