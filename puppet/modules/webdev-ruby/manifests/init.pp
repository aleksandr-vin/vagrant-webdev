class webdev-ruby {
  rbenv::install { "vagrant": 
  }

  rbenv::compile { "vagrant/2.1.1":
    user   => "vagrant",
    ruby   => "2.1.1",
    global => true
  }
}