# install & configure elastic search

class profiles::elastic {

  include java
  include 'yum'

  firewall { '302 allow elasticsearch access':
    dport  => [9200],
    proto  => tcp,
    action =>  accept,
  }
  
  class { 'elasticsearch':
    version => '5.4.3',
    ensure => 'present',
    status => 'enabled',
    manage_repo  => true,
    restart_on_change => true,
  }
  ->
  elasticsearch::instance { 'graylog':
    config => {
      'cluster.name' => 'graylog',
     'network.host' => $facts['fqdn'],
      #'network.host' =>  "${::ec2_metadata['public-ipv4']}",
    },
    jvm_options => [
     '-Xms512m',
     '-Xmx512m'
    ]
  }
}
