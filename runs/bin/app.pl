#!/usr/bin/env perl
use strict;
use warnings;
use v5.018;

use Dancer;
#use Dancer::Plugin::Database;
use Dancer::Plugin::SimpleCRUD;



use runs;

set template => 'template_toolkit';
set log => "debug";
set logger => "console";
set warnings => 1;





# my $fred = $users_rs->create({
#   realname => 'Fred Bloggs',
#   username => 'fred',
#   password => Authen::Passphrase::SaltedDigest->new(
#      algorithm => "SHA-1",
#      salt_random => 20,
#      passphrase => 'mypass',
#   ),
#   email => 'fred@bloggs.com',
# });

dance;
