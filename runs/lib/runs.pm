package runs;

use strict;
use warnings;
use v5.018;

use Dancer ':syntax';
use Dancer::Plugin::Ajax;
use Dancer::Plugin::FlashMessage;

use Dancer::Plugin::DBIC;
use Authen::Passphrase::SaltedDigest;


use POSIX qw(strftime);


our $VERSION = '0.1';

#the routing part

get '/' => sub {
    template 'index';
};

get '/add' => sub {
    template 'add';
};

get '/login' => sub {
    template 'login';
};

get '/stats' => sub {
    template 'stats';
};

#the post processing part
any ['get', 'post'] => '/login' => sub {

     if ( request->method() eq "POST" ) {
       # process form input
       my $user_rs = schema('default')->resultset('User');

       if (! $user_rs->find({
        username => param('user') },{ password => param('pass') }) ) {
         flash error => "unsuccesful login";
       }else {
        my $u=$user_rs->find({
        username => param('user') },{ password => param('pass') });
         session 'logged_in' => true;
         session 'user_id' => $u->id;
         return template '/stats';
         flash success =>'You are logged in.';
       }
    }

    # display login form
    return template 'login';
  };

post '/' => sub {

     if ( request->method() eq "POST" ) {
       # process form input
       my $user_rs = schema('default')->resultset('User');

       if (!param('user') ) {
         flash error => "unsuccesful login";
       }else {
         $user_rs->create({
            password=>param('pass1'),
            username=>param('user'),
            first_name=>param('fname'),
            last_name=>param('lname'),
            email=>param('email'),
            is_admin=>0,
            date_joined=> strftime "%m/%d/%Y", localtime
          });
         return template '/login';
         flash success =>'You are registered.';
       }
    }

    return template 'index';
  };

  post '/add' => sub {

     if ( request->method() eq "POST" ) {
       # process form input
       my $log_rs = schema('default')->resultset('Log');
       my $uID=session 'user_id';
       if (!$uID ) {
         flash error => "login first";
       }else {
         $log_rs->create({
            user_id=> $uID,
            description=>param('description'),
            distance=>param('distance'),
            date=> strftime "%m/%d/%Y", localtime
          });
         return template '/stats';
         flash success =>'You have added a log.';
       }
    }

    return template 'add';
  };



ajax '/stats' => sub {
    #here we will unpack the resultset from the select all from logs
    my @cat;
    my @dis;
    my $log_rs = schema('default')->resultset('Log');
    while (my $log = $log_rs->next) {
       push @cat, $log->description;
       push @dis, $log->distance;
    }
    return template 'stats',{
      'cat' => @cat,
      'dis' => @dis,
    };
};

true;
