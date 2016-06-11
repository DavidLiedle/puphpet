class puphpet::wpcli (
  $wpcli = $puphpet::params::config['wpcli'],
  $php   = $puphpet::params::config['php'],
  $hhvm  = $puphpet::params::config['hhvm'],
) {

  $version  = $wpcli['version'] != undef
  $engine   = (array_true($php, 'install') or array_true($hhvm, 'install'))
  $composer = (array_true($php, 'composer') or array_true($hhvm, 'composer'))

  # Requires either PHP or HHVM, and Composer
  if $version and $engine and $composer {
    class { 'puphpet::php::wordpress::wpcli' :
      version => $wpcli['version']
    }
  }

}
