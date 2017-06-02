#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

# use this block if you don't need middleware, and only have a single target Dancer app to run here
use App::Panda::Manager;

App::Panda::Manager->to_app;

use Plack::Builder;
use Consul;

builder {
 enable 'Deflater';

	my $consul = Consul -> new({
		'host' => $ENV{'CONSUL_HOST'},
		'port' => $ENV{'CONSUL_PORT'},
	});
	my $agent = $consul -> agent;
	$agent -> service_register({
		'name' => 'panda'
	});

	App::Panda::Manager->to_app;
}

