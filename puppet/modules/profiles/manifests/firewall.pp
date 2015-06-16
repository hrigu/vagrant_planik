class profiles::firewall (
  $rules = {},
  ) {
  # Purge any existing rules
  resources { "firewall":
    purge => true
  }

  # Ensure pre and post are run in the correct order to avoid locking us out
  # during the first Puppet run.
  Firewall {
    before  => Class['profiles::firewall::post'],
    require => Class['profiles::firewall::pre'],
  }

  class { ['profiles::firewall::pre', 'profiles::firewall::post']: }

  class { '::firewall': }

  $rules_defaults = {
    proto   => 'all',
    action  => 'accept',
  }
  create_resources(firewall, $rules, $rules_defaults)

}

class profiles::firewall::pre {
  Firewall {
    require => undef,
  }

  # Set policies
  firewallchain { 'INPUT:filter:IPv4':
    policy => 'drop',
  }
  firewallchain { 'FORWARD:filter:IPv4':
    policy => 'drop',
  }
  firewallchain { 'OUTPUT:filter:IPv4':
    policy => 'accept',
  }

  # Default firewall rules
  firewall { '001 Allow everything from loopback interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }
  firewall { "002 Reject local traffic not on loopback interface":
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }
  firewall { '003 Allow existing and related connections':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }
  firewall { '004 Allow ICMP echo replies':
    proto   => 'icmp',
    action  => 'accept',
    icmp    => 'echo-reply',
  }
  firewall { '005 Allow ICMP destination unreachable':
    proto   => 'icmp',
    action  => 'accept',
    icmp    => 'destination-unreachable',
  }
  firewall { '006 Allow ICMP time exceeded':
    proto   => 'icmp',
    action  => 'accept',
    icmp    => 'time-exceeded',
  }
  firewall { '007 Allow ICMP echo requests (aka ping)':
    proto   => 'icmp',
    action  => 'accept',
    icmp    => 'echo-request',
  }
  firewall { '020 Allow SSH':
    dport => '22',
    proto => 'tcp',
    action => 'accept',
  }

}

class profiles::firewall::post {

  firewall { '997 Nicely reject TCP':
    proto => 'tcp',
    action => 'reject',
    reject => 'tcp-reset',
    before  => undef,
  }
  firewall { '998 Nicely reject UDP':
    proto => 'udp',
    action => 'reject',
    reject => 'icmp-port-unreachable',
    before  => undef,
  }
  firewall { '999 Nicely reject ICMP':
    proto => 'icmp',
    action => 'reject',
    reject => 'icmp-host-unreachable',
    before  => undef,
  }

}
