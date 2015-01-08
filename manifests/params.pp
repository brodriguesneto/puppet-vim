# Class: vim::params
class vim::params {
  case $::operatingsystem {
    'Ubuntu' : {
      case $::lsbdistrelease {
        /(12.04|14.04|14.10)/ : {
          $package     = 'vim'
          $vimrc       = '/etc/vim/vimrc'
          $background  = 'dark'
          $syntax      = true
          $options = [
            'showcmd',
            'showmatch',
            'ignorecase',
            'smartcase',
            'incsearch',
            'autowrite',
            'hidden',
            'mouse=a',
            'nu',]
        }
        default         : {
          case $::lsbdistrelease {
            default : { fail("Unsupported Ubuntu suite: ${::lsbdistrelease}") }
          }
        }
      }
    }
    default  : {
      case $::operatingsystem {
        default : { fail("Unsupported operating system: ${::operatingsystem}") }
      }
    }
  }
}
