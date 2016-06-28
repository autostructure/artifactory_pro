# == Class artifactory::params
#
# This class is meant to be called from artifactory.
# It sets variables according to platform.
#
class artifactory_pro::params {
  $license_key                    = undef
  $plugins_dir                    = '/etc/opt/jfrog/artifactory/plugins'
  $db_type                        = undef
  $db_url                         = undef
  $db_username                    = undef
  $db_password                    = undef
  $binary_provider_type           = undef
  $pool_max_active                = undef
  $pool_max_idle                  = undef
  $binary_provider_cache_maxSize  = undef
  $binary_provider_filesystem_dir = undef
  $binary_provider_cache_dir      = undef

  $package_name = 'artifactory'
  $service_name = 'artifactory'

}
