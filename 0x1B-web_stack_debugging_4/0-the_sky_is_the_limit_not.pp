# Increase the ULIMIT of the Nginx configuration
exec { 'fix_ulimit_for_nginx':
  command => 'sed -i "s/^ULIMIT/#ULIMIT/" /etc/default/nginx && echo "ULIMIT=\"-n 4096\"" >> /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
  onlyif  => 'grep -q -e "^ULIMIT" /etc/default/nginx || echo 0',
} ->

# Restart Nginx to apply changes
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/usr/local/bin/:/usr/bin/:/bin/:/sbin/:/usr/sbin/',
  require => Exec['fix_ulimit_for_nginx'],
}
