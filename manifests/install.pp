# influxdb::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include influxdb::install
class influxdb::install {

  $manage_repo = $influxdb::manage_repo

  if $influxdb::manage_repo {

  

    yumrepo {'influxdb':
      ensure   => present,
      baseurl  => 'https://repos.influxdata.com/rhel/\$releasever/\$basearch/stable',
      enabled  => true,
      gpgcheck => true,
      gpgkey = 'https://repos.influxdata.com/influxdb.key',    
    }

  }

}
