class nginx {
  
  package { ["nginx"]:
    ensure => latest,
    require => Exec["apt-get-update"]
  }

  service { "nginx":
    ensure => stopped,
    require => Package["nginx"],
  }
}
