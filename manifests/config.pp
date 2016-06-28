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

  # Install storage.properties if Available
  if(
    $::artifactory_pro::db_url or
    $::artifactory_pro::db_username or
    $::artifactory_pro::db_password or
    $::artifactory_pro::db_type
    ) {
    file { '/var/opt/jfrog/artifactory/etc/storage.properties':
      ensure  => file,
      content => epp(
        'artifactory/oracle.properties.epp',
        {
          db_url                         => $::artifactory_pro::db_url,
          db_username                    => $::artifactory_pro::db_username,
          db_password                    => $::artifactory_pro::db_password,
          db_type                        => $::artifactory_pro::db_type,
          binary_provider_type           => $::artifactory_pro::binary_provider_type,
          pool_max_active                => $::artifactory_pro::pool_max_active,
          pool_max_idle                  => $::artifactory_pro::pool_max_idle,
          binary_provider_cache_maxSize  => $::artifactory_pro::binary_provider_cache_maxSize,
          binary_provider_filesystem_dir => $::artifactory_pro::binary_provider_filesystem_dir,
          binary_provider_cache_dir      => $::artifactory_pro::binary_provider_cache_dir,
        }
      ),
      mode    => '0664',
    }
  }
}
