class webdev_ruby (
  $user           = 'vagrant',
  $ruby_versions  = [],
  $global_version = '',
  $install_gems   = []
){
  rbenv::install {'vagrant': 
  }

  # install pythons (with pyenv) and packages
  $ruby_versions.each |$version| { 
    if $global_version == $version {
      $is_global = true
    } else {
      $is_global = false
    }

    rbenv::compile { "${user}/${version}":
      user    => $user,
      ruby    => $version,
      global  => $is_global,
      require => Rbenv::Install['vagrant'],
    }

    $install_gems.each |$gem| {
      rbenv::gem { $gem:
        user => $user,
        ruby => $version,
        require => Rbenv::Compile["${user}/${version}"],   
      }
    }
  }
}