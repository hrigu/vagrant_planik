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
