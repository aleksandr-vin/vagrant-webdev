class webdev-python {
  class { 'pyenv': }

  pyenv::install { 'vagrant': 
    require => Class['pyenv']
  }

  pyenv::compile { 'compile 2.7.6 vagrant':
    user   => 'vagrant',
    python => '2.7.6',
    global => true,
    require => Pyenv::Install['vagrant']
  }

  # pyenv::compile { 'compile 3.4.0 vagrant':
  #   user    => 'vagrant',
  #   python  => '3.3.0',
  #   global  => false,
  #   require => Pyenv::Install['vagrant']
  # }

  # pip {'install packages':
  #   ensure          => 'installed',  
  #   user            => 'vagrant',  
  #   package         => [ 'django', 'flask' ],  
  #   #package_version => [ '==1.3.0', '==1.0.1' ], 
  #   python_version  => '2.7.6', 
  #   require => Pyenv::Compile['compile 2.7.6 vagrant'],
  # }

  # pip {'install dev packages':
  #   ensure          => 'installed',  
  #   user            => 'vagrant',  
  #   package         => [ 'django', 'flask' ],  
  #   #package_version => [ '==1.3.0', '==1.0.1' ], 
  #   python_version  => '3.4.0', 
  #   require => Pyenv::Compile['compile 3.4.0 vagrant'],
  # }
}