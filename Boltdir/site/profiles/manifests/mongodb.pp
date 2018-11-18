
class profiles::mongodb {

  firewall { '303 allow mongodb access':
     dport  => [27017],
     proto  => tcp,
     action =>  accept,
  }

  class { '::mongodb::globals':
    manage_package_repo => true,
    version => '4.0.4',
  } ->
  class { 'mongodb::server':
    verbose => true,
    bind_ip => ['0.0.0.0'],
    noauth => true,
  }
  -> class { '::mongodb::client':}

  mongodb::db { 'graylog':
    user          => 'graylog',
    password_hash => '1e4b7abf4ca5836802deb6ab43100c35',
  }
}
