class zendstack::php {
  package { ['php5', 'php5-mysql', 'php5-gd', 'libapache2-mod-php5']: ensure => present, }
  file { '/etc/php5/cli/php.ini': ensure => present,}

  line { 'include-zend':
    file => '/etc/php5/cli/php.ini',
    line => "include_path = ".:/usr/share/php:/opt/ZendFramework/current/library",
    ensure => present,
  } 
}
