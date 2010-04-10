#!/usr/bin/perl
use Module::Build;

my $build = new Module::Build (
  module_name   => 'Funifs',
  dist_version_from => 'funifs',
  dist_abstract => 'FUSE read-only Union Filesystem',
  license       => 'perl',
  dist_author   => q{Vladimir Kolpakov <vova@cpan.org>},
  requires => {
    'Fuse' => 0.09,
    'Unix::Syslog' => 0,
    'Filesys::Statvfs' => 0,
  },
  sys_files => {
    'funifs' => 'sys/usr/sbin/funifs',
    'fuse'   => 'sys/etc/init.d/fuse',
    'README' => 'sys/usr/share/doc/packages/funifs/README',
  },
  install_path  => { 'sys' => '/', },
  #create_packlist => 0,        #-- enable this to disable .packlist creation
);

$build->add_build_element('sys');

my $ib = $build->install_base() ;       #-- run "./Build.PL --install_base=/var/tmp/Funifs"  to see how it works
#$build->install_path('sys' => "$ib/w");
 $build->install_path('sys' =>  $ib ? $ib : '/');

$build->create_build_script;

