#!/usr/bin/perl
use Test::More tests => 1;
ok( `blib/sys/usr/sbin/funifs --version` =~ m/[0-9]+/, 'version');
