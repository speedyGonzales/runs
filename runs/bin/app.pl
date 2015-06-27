#!/usr/bin/env perl
use strict;
use warnings;
use v5.018;

use Dancer;
use Dancer::Plugin::Database;
use Dancer::Plugin::SimpleCRUD;

use DBI;

use runs;

set template => 'template_toolkit';
set log => "debug";
set logger => "console";
set warnings => 1;



post '/login' => sub {
    # Validate the username and password they supplied
    if (params->{user} eq 'admin' && params->{pass} eq 'admin') {
        session user => params->{user};
        redirect params->{path} || '/';
    } else {
        redirect '/login?failed=1';
    }
};


dance;
