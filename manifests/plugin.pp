#
#
define artifactory_pro::plugin(
  String $url,
  )
{
  # Default file sould have artifactory owner and group
  File {
    owner => 'artifactory',
    group => 'artifactory',
    mode  => 'a+rx',
  }

  $file_name =  regsubst($url, '.+\/([^\/]+)$', '\1')

  ::wget::fetch { $url:
    destination => "${::artifactory::artifactory_home}/etc/plugins/${file_name}",
    execuser    => 'artifactory',
    mode        => 'a+rx',
  } ->
  file {"${::artifactory::artifactory_home}/etc/plugins/${file_name}":
    ensure => file,
  }
}
