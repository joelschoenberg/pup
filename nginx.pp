include firewall
class { "nginx": }
nginx::resource::vhost { 'techchallenge':
  ensure      => present,
  www_root    => '/usr/share/nginx/html',
  listen_port => 8000
}

file { "/usr/share/nginx/html/index.html":
    ensure => 'present',
    source => '/vagrant/index.html',
}
firewall { '100 allow http and https access':
    dport   => [80, 443, 8000],
    proto  => tcp,
    action => accept,
}
