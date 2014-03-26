class webdev_python (
  $user             = 'vagrant',
  $python_versions  = [],
  $global_version   = '',
  $install_packages = []
){
  class {'pyenv': }

  pyenv::install {'vagrant': 
    require => Class['pyenv']
  }

  # install pythons (with pyenv) and packages
  $python_versions.each |$version| { 
    if $global_version == $version {
      $is_global = true
    } else {
      $is_global = false
    }

    pyenv::compile {"compile ${user} ${version}":
      user   => $user,
      python => $version,
      global => $is_global,
      require => Pyenv::Install['vagrant']
    }
    
    pip {"install packages for ${version}":
      ensure          => 'installed',  
      user            => $user,
      package         => $install_packages,  
      python_version  => $version, 
      require => Pyenv::Compile["compile ${user} ${version}"],
    }    
  }
}