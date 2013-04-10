class zendstack::zend_app {
  package { curl: ensure => present,}

  exec {'install-composer':
    command => 'curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin',
    path => ['/usr/bin'],
    require => Package['curl'], 
  }
  
  file {'/var/www/ZendApp':
    ensure => directory,
    mode => 777,
  }

  exec {'create-skeleton-zend-app':
    command => 'php /bin/composer.phar create-project --repository-url="http://packages.zendframework.com" zendframework/skeleton-application /var/www/ZendApp',
    path => ["/usr/bin"],
    require => [ File['/var/www/ZendApp'], Exec['install-composer']],
  }
}
