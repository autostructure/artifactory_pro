# Class: artifactory
# ===========================
#
# Full description of class artifactory here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#

class artifactory_pro(
  String $license_key,
  Boolean $manage_java                                                                     = true,
  Boolean $manage_repo                                                                     = true,
  String $yum_name                                                                         = 'bintray-jfrog-artifactory-pro-rpms',
  String $yum_baseurl                                                                      = 'http://jfrog.bintray.com/artifactory-pro-rpms',
  String $package_name                                                                     = 'jfrog-artifactory-pro',
  String $package_version                                                                  = 'present',
  String $artifactory_home                                                                 = '/var/opt/jfrog/artifactory',
  Optional[String] $root_password                                                          = 'password',
  Optional[String] $jdbc_driver_url                                                        = undef,
  Optional[Enum['derby', 'mssql', 'mysql', 'oracle', 'postgresql']] $db_type               = undef,
  Optional[String] $db_url                                                                 = undef,
  Optional[String] $db_username                                                            = undef,
  Optional[String] $db_password                                                            = undef,
  Optional[Boolean] $db_automate                                                           = false,
  Optional[Enum['filesystem', 'fullDb', 'cachedFS', 'fullDbDirect']] $binary_provider_type = undef,
  Optional[Integer] $pool_max_active                                                       = undef,
  Optional[Integer] $pool_max_idle                                                         = undef,
  Optional[Integer] $binary_provider_cache_maxsize                                         = undef,
  Optional[String] $binary_provider_base_data_dir                                          = undef,

  Optional[String] $binary_provider_filesystem_dir                                         = undef,
  Optional[String] $binary_provider_cache_dir                                              = undef,
  Hash $plugin_urls                                                                        = {},
  Optional[String] $master_key                                                             = undef,
) {

  class{'::artifactory':
    manage_java                    => $manage_java,
    manage_repo                    => $manage_repo,
    yum_name                       => $yum_name,
    yum_baseurl                    => $yum_baseurl,
    package_name                   => $package_name,
    package_version                => $package_version,
    root_password                  => $root_password,
    jdbc_driver_url                => $jdbc_driver_url,
    db_type                        => $db_type,
    db_url                         => $db_url,
    db_username                    => $db_username,
    db_password                    => $db_password,
    db_automate                    => $db_automate,
    binary_provider_type           => $binary_provider_type,
    pool_max_active                => $pool_max_active,
    pool_max_idle                  => $pool_max_idle,
    binary_provider_cache_maxsize  => $binary_provider_cache_maxsize,
    binary_provider_filesystem_dir => $binary_provider_filesystem_dir,
    binary_provider_base_data_dir  => $binary_provider_base_data_dir,
    binary_provider_cache_dir      => $binary_provider_cache_dir,
    master_key                     => $master_key,
  }
  -> class{'::artifactory_pro::config': }
  -> class{'::artifactory_pro::post_config': }

  # Ensure base Artifactory is configured before pro Artifactory
  Class['::artifactory::config']
  -> Class['::artifactory_pro::config']
  ~> Class['::artifactory::service']

  Class['::artifactory_pro::post_config']
  ~> Class['::artifactory::service']
}
