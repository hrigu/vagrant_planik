exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

# set global path variable for project
# http://www.puppetcookbook.com/posts/set-global-exec-path.html
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin", "~/.composer/vendor/bin/" ] }


class { 'git::install': }

# ruby
# puppet module install puppetlabs-ruby
# git submodule add https://github.com/puppetlabs/puppetlabs-ruby.git puppet/modules/ruby
# Installiert ruby in /usr/bin/ruby2.0. Den Symlin /usr/bin/ruby zeigt aber immer noch auf die alte ruby1.9.1 version...
# Musste das manuell ändern.
class { 'ruby':
  version         => '2.0.0', # Höher auf Ubuntu nicht mögich, sieh ruby/manifests/init.pp
#  gems_version    => '2.1.6',
}

#class { 'apache2::install': }
#class { 'php5::install': }
#class { 'mysql::install': }