# install and configure graylog service

class profiles::graylog {

  # install OpenJDK
  include java


  class { '::mongodb::globals':
    manage_package_repo => true,
    version => '4.0.4',
  } ->  class {'mongodb::client':}

  firewall { '304 allow graylog access':
    dport  => [9000],
    proto  => tcp,
    action =>  accept,
  }
  
  firewall { '305 allow graylog syslog udp input':
    dport  => [5442],
    proto  => udp,
    action =>  accept,
  }
  firewall { '306 allow graylog syslog tcp input':
    dport  => [5442],
    proto  => tcp,
    action =>  accept,
  }
  
  class { 'graylog::repository':
    version => '2.4'
  }->
  class { 'graylog::server':
    package_version => '2.4.0-9',
    config          => {
      'is_master'           => true,
      'root_username'       => 'admin',
      'password_secret'     => '2FCsLlZ0Ch0PuAzq068=',
      'root_password_sha2'  => '18f13ce143fda8db47f70cc469ebbd3c638efe3215f59144fb2292aee9429584',
      'web_enable'          => true,
      'web_enable_tls'      => false, 
      'web_listen_uri'      => "http://ec2-34-216-113-121.us-west-2.compute.amazonaws.com:9000",
      'rest_listen_uri'     => "http://ec2-34-216-113-121.us-west-2.compute.amazonaws.com:9000/api/",
      'rest_transport_uri'  => "http://ec2-34-216-113-121.us-west-2.compute.amazonaws.com:9000/api/",
      'elasticsearch_hosts' => 'http://ec2-52-34-245-172.us-west-2.compute.amazonaws.com:9200',
      'mongodb_uri'         => 'mongodb://ec2-34-210-75-1.us-west-2.compute.amazonaws.com:27017/graylog',
      'mongodb_useauth'     => false,
    }
  } 

}
