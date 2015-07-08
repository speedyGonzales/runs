package runs;

use strict;
use warnings;
use v5.018;

use Dancer ':syntax';
use Dancer::Plugin::Ajax;
use Dancer::Plugin::FlashMessage;
use Dancer::Plugin::DBIC;

use Authen::Passphrase::SaltedDigest;

use JSON;


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
    my @c; my @d;
    my @data;

    my $u_ID=session 'user_id';
    if (!$u_ID ) {
      flash error => "login first";
    }
    else {

      my @logs=schema('default')->resultset('Log')->search({user_id => 2});
     foreach my $l (@logs) {
        push @c ,$l->description;
        push @d, $l->distance;
        # push %data {"cat": $l->description,"dat": $l->distance};
      }
     }
     #my $json_text=encode_json \@data;





    # my $json_text = '[
    #       {
    #         "cat": "Simple run 1",
    #         "dat": 10
    #       },
    #       {
    #         "cat": "Simple run 2",
    #         "dat": 8
    #       },
    #       {
    #         "cat": "Simple run 3",
    #         "dat": 8
    #       }
    # ]';

    # my @c=('simple 1', 'simple2','simple 3');
    my $cat=join(', ', @c);
    # my @d=('10','11','13');
    my $dat=join(', ', @d);
    #my $data = from_json $json_text;
    #my $data = from_json $json;
    #'data' => {'cat' => $cat,'dat' => $dat},
    template 'stats', {'cat' => $cat,'dat' => $dat };
};




#the post processing part
any ['get', 'post'] => '/login' => sub {

     if ( request->method() eq "POST" ) {
       my $user_rs = schema('default')->resultset('User');
       #check if there is user with that name and pass
       if (! $user_rs->find({
        username => param('user') },{ password => param('pass') }) ) {
         flash error => "unsuccesful login";
       }else {
        my $u=$user_rs->find({
        username => param('user') },{ password => param('pass') });
         session 'logged_in' => true;
         session 'user_id' => $u->id;
         flash success =>'You are logged in.';
         return template 'login';
       }
    }
    return template 'login';
  };

post '/' => sub {

     if ( request->method() eq "POST" ) {
       my $user_rs = schema('default')->resultset('User');

       if (!param('user') ) {
            flash error => "unsuccesful login";
       }
       elsif(param('pass1') ne param('pass2')){
            flash error => "You have entered different passwords!";
       }
       else {
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



  get '/stats' => sub {
    #here we will unpack the resultset from the select all from logs
    # my @cat;
    # my @dis;
    print "something";
    my @logs = ('aaa','bbb','ccc');
    my $log_rs = schema('default')->resultset('Log');
    return template 'stats', {'logs' => \@logs };

    # while (my $log = $log_rs->next) {
    #    push @cat, $log->description;
    #    push @dis, $log->distance;
    # }
    #return template 'stats';
};

true;
