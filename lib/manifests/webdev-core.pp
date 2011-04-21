# import "installtools"
# import "git"
# import "javascript"
# import "python"
# import "apache2"
# import "nginx"

class core {
  exec { "apt-get-update":
    command => "apt-get update",
    path => ["/bin", "/usr/bin"],
  }

  Package {
   ensure => installed,
   require => Exec["apt-get-update"]
  }

  package { ["vim", "tmux", "curl", "build-essential", "openssl", "libssl-dev", "python-software-properties", "rhino", "php-pear"]:
    ensure => latest,
    require => Exec["apt-get-update"]
  }
}

include core
include git
include python
include javascript
include apache2
include nginx