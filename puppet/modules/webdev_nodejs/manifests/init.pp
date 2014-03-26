class webdev_nodejs (
  $nodejs_version   = '',
  $install_packages = []
){
  class { 'nodejs':
    version => $nodejs_version,
  }  

  $install_packages.each |$pkg| {    
    package { $pkg:
      provider => npm
    } 
  }
}