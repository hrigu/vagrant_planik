exec { 'apt_update':
  command => 'apt-get update',
  path    => '/usr/bin'
}

# set global path variable for project
# http://www.puppetcookbook.com/posts/set-global-exec-path.html
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin", "~/.composer/vendor/bin/" ] }


# ruby
# puppet module install puppetlabs-ruby
# git submodule add https://github.com/puppetlabs/puppetlabs-ruby.git puppet/modules/ruby
# Installiert ruby in /usr/bin/ruby2.0. Den Symlin /usr/bin/ruby zeigt aber immer noch auf die alte ruby1.9.1 version...
# Musste das manuell ändern.
# class { 'ruby':
#   version         => '2.0.0', # Höher auf Ubuntu nicht mögich, sieh ruby/manifests/init.pp
#  gems_version    => '2.0.0',
# }

# zu viele Abhängigkeiten
# puppet module install --modulepath /path/to/puppet/modules jdowning-rbenv
# git submodule add https://github.com/justindowning/puppet-rbenv.git puppet/modules/rbenv
# class { 'rbenv': }

# !!Es gab folgenden Fehler: Error: Unknown function ensure_packages at /tmp/vagrant-puppet/modules-33ebedc53dc8bbda276f80f73ef8a26c/gcc/manifests/init.pp:17 on node vagrant-ubuntu-trusty-64.fritz.box
# -> auskommentiert modules/gcc/manifests/init.pp ensure...
# !! puppet funktioniert dann nicht mehr. (/usr/bin/puppet:3:in `require': no such file to load -- puppet/util/command_line (LoadError)
# puppet wieder installieren (sudo gem install puppet -v 3.7.5)
# Installiert es unter /opt/2.2.2 und macht einen /opt/ruby link auf /opt/2.2.2


class { "rubybuild":
  ruby_version => "2.1.6",
}
file { '/usr/bin/ruby':
  ensure => 'link',
  target => '/opt/ruby/bin/ruby', # Was ist mit den anderen Tools in /opt/ruby/bin? (erb)
}
file { '/usr/bin/gem':
  ensure => 'link',
  target => '/opt/ruby/bin/gem',
}
file { '/usr/bin/irb':
  ensure => 'link',
  target => '/opt/ruby/bin/irb',
}

class { 'webapp::install': }
class { 'apache2::install': }

#class { 'php5::install': }
#class { 'mysql::install': }