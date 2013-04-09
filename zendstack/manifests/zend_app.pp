class zendstack::zand_app {
  package { 'curl': ensure => present,}

  exec {'install-composer':
    command => 'curl -sS https://getcomposer.org/installer | php -- --install-dir=bin',
    ensure  => present,
    require => Package['curl'],
  }
  
  file {'/var/www/ZendApp':
    ensure => directory,
    mode => 777,
  }

  exec {'create-skeleton-zend-app':
    command => 'php composer.phar create-project --repository-url="http://packages.zendframework.com" zendframework/skeleton-application /var/www/ZendApp'
  }
}
