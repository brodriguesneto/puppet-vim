# Class vim::config
class vim::config {
  file { $vim::params::vimrc:
    ensure  => $vim::file_ensure,
    content => template('vim/vimrc.erb'),
    require => Class['vim::install']
  }
}
