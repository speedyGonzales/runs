use utf8;
package MyApp::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 first_name

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 75

=head2 is_admin

  data_type: 'bool'
  is_nullable: 0

=head2 date_joined

  data_type: 'datetime'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "first_name",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "last_name",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 75 },
  "is_admin",
  { data_type => "bool", is_nullable => 0 },
  "date_joined",
  { data_type => "datetime", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<username_unique>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("username_unique", ["username"]);

=head1 RELATIONS

=head2 logs

Type: has_many

Related object: L<MyApp::Schema::Result::Log>

=cut

__PACKAGE__->has_many(
  "logs",
  "MyApp::Schema::Result::Log",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-06-29 15:45:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9e1R3H/gyEjpYzG9Pdcgcw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
