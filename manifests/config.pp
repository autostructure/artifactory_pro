# == Class artifactory::config
#
# This class is called from artifactory for service config.
#
class artifactory_pro::config {
  # Default file sould have artifactory owner and group
  File {
    owner => 'artifactory',
    group => 'artifactory',
  }

  # Create the plugins directory
  file { "${::artifactory::artifactory_home}/etc/plugins":
    ensure  => directory,
  }

  # Add the license file
  file { "${::artifactory::artifactory_home}/etc/artifactory.lic":
    ensure  => file,
    content => $::artifactory_pro::license_key,
    mode    => '0664',
  }
}
