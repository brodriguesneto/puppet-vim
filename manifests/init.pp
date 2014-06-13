# Class: vim
class vim ($ensure = 'present', $autoupgrade = false) inherits vim::params {
  case $ensure {
    /(present)/ : {
      $file_ensure = 'present'

      if $autoupgrade == true {
        $package_ensure = 'latest'
      } else {
        $package_ensure = 'present'
      }

    }
    /(absent)/  : {
      $file_ensure = 'absent'
      $package_ensure = 'absent'
    }
    default     : {
      fail('ensure parameter must be present or absent')
    }
  }
  include vim::install, vim::config
  Class['vim::install'] -> Class['vim::config']
}
