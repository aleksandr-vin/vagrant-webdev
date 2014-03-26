Exec { path => "/usr/bin" }

#### Update packages ##########################################################
stage { 'preinstall':
  before => Stage['main']
}
class apt_get_update {
  exec { 'apt-get -y update': }
}
class { 'apt_get_update':
  stage => preinstall
}

#### Install software #########################################################
class { 'webdev_ruby': 
  ruby_versions  => ['2.1.1'],
  global_version => '2.1.1',
  install_gems   => ['sinatra', 'cucumber'],
}

class { 'webdev_python': 
  python_versions  => ['2.7.6', '3.4.0'],
  global_version   => '2.7.6',
  install_packages => ['django', 'flask'],
}

class { 'webdev_nodejs': 
  nodejs_version   => 'v0.10.26',
  install_packages => ['docpad'],
}

