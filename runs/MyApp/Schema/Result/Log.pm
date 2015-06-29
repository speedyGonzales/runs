use utf8;
package MyApp::Schema::Result::Log;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyApp::Schema::Result::Log

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<logs>

=cut

__PACKAGE__->table("logs");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 date

  data_type: 'datetime'
  is_nullable: 0

=head2 description

  data_type: 'text'
  is_nullable: 0

=head2 distance

  data_type: 'integer'
  is_nullable: 0

=head2 time

  data_type: 'datetime'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "date",
  { data_type => "datetime", is_nullable => 0 },
  "description",
  { data_type => "text", is_nullable => 0 },
  "distance",
  { data_type => "integer", is_nullable => 0 },
  "time",
  { data_type => "datetime", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<MyApp::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "MyApp::Schema::Result::User",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-06-29 15:45:01
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OHGCn4Q7wsOBJyiz41sFUw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
