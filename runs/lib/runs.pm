package runs;

use strict;
use warnings;
use v5.018;

use Dancer ':syntax';

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

#login form
# post '/login' => sub {
#     my $user = param 'user' ;
#     my $pass = param 'pass' ;

#     if (length($user)==0) {
#         return template '/login', {
#             show_warning => "Please enter username" };
#     }
#     if (length($pass)==0) {
#         return template '/login', {
#             show_warning => "Please enter password" };
#     }

#     my $dsn = "dbi:SQLite:dbname=foo.sqlite";

#     my $dbh = DBI->connect($dsn, $user, $password, {
#        PrintError       => 0,
#        RaiseError       => 1,
#        AutoCommit       => 1,
#        FetchHashKeyName => 'NAME_lc',
#     });

#     my $sql = 'SELECT * FROM users WHERE username =? AND password= ?';
#     my $sth = $dbh->prepare($sql);
#     $sth->execute($user,$pass);

#     @row = $sth->fetchrow_array();
#     my $size = @row;

#     if($size == 0){
#          return template '/login', {
#             show_warning => "There arent such user" };
#     }

#     my $sql = 'SELECT * FROM logs';
#     my $sth = $dbh->prepare($sql);
#     $sth->execute();

#     @result = $sth->fetchrow_array();
#     template 'stats', { data => $sth };
# };

# #login form
# post '/' => sub {
#     $sql = 'SELECT * FROM users WHERE username =? AND password= ?';
#     $sth = $dbh->prepare($sql);
#     $sth->execute($user,$pass);
# };

true;
