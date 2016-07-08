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
  file { "${::artifactory_pro::artifactory_home}/etc/plugins":
    ensure  => directory,
  }

  ### TODO: Put back notify #notify  => Service['artifactory'],
  #file { "${::artifactory::plugins_dir}/zip_upload.groovy":
  #  source  => 'puppet:///modules/artifactory/zip_upload.groovy',
  #}

  # Add the license file
  file { "${::artifactory_pro::artifactory_home}/etc/artifactory.lic":
    ensure  => file,
    content => $::artifactory_pro::license_key,
    mode    => '0664',
  }
}
