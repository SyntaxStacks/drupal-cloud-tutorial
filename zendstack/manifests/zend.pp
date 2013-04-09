class zendstack::zendapp {
  $zend_version = '2.1.4'

  file { '/opt/ZendFramework': ensure => directory, }

  exec {'install-framework':
    command => "wget https://packages.zendframework.com/releases/ZendFramework-2.1.4/ZendFramework-${zend-version}.zip -P /opt/ZendFramework",
    path => ['usr/bin'],
    creates => "/opt/ZendFramework/ZendFramework-${zend_version}.zip",
    require => File['/opt/ZendFramework'],
  }

  exec { 'unzip-zend': 
    command => "unzip /opt/ZendFramework/ZendFramework-${zend_version}.zip,
    path => ['/bin'],
    creates => "/opt/ZendFramework/ZendFramework-${zend_version}",
    require => Exec['install-framework'],
  }

  file { '/opt/ZendFramework/current': 
    ensure => link,
    target => '/opt/ZendFramework/ZendFramework-${zend-version}',
    require => Exec['unzip-zend'],
  }
}
