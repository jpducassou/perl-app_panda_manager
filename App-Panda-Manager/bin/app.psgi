#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use App::Panda::Manager;

App::Panda::Manager->to_app;

use Plack::Builder;

builder {
    enable 'Deflater';
    App::Panda::Manager->to_app;
}



=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use App::Panda::Manager;
use Plack::Builder;

builder {
    enable 'Deflater';
    App::Panda::Manager->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use App::Panda::Manager;
use App::Panda::Manager_admin;

builder {
    mount '/'      => App::Panda::Manager->to_app;
    mount '/admin'      => App::Panda::Manager_admin->to_app;
}

=end comment

=cut

