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
  file { $::artifactory_pro::plugins_dir:
    ensure  => directory,
  }

  ### TODO: Put back notify #notify  => Service['artifactory'],
  #file { "${::artifactory::plugins_dir}/zip_upload.groovy":
  #  source  => 'puppet:///modules/artifactory/zip_upload.groovy',
  #}

  # Add the license file
  file { '/var/opt/jfrog/artifactory/etc/artifactory.lic':
    ensure  => file,
    content => $::artifactory_pro::license_key,
    mode    => '0664',
  }
}
