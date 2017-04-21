package App::Panda::Manager::Schema::Pandas;

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->table("pandas");

__PACKAGE__->add_columns(
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "description",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);
__PACKAGE__->set_primary_key("name");

1;
