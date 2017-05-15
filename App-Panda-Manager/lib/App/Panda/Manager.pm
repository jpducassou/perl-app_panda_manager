package App::Panda::Manager;

use strict;
use warnings;

use Dancer2;
use Dancer2::Plugin::DBIC;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'App::Panda::Manager' };
};

set serializer => 'JSON';

# CREATE
post '/panda' => sub {
	send_error('no panda name', 400) unless body_parameters -> get('name');
	my $payload = {};
	my $rs = schema -> resultset('Pandas');
	my @column_names = $rs -> result_source -> columns;
	foreach my $column_name (@column_names) {
		if (defined(body_parameters -> get($column_name))) {
			$payload -> {$column_name} = body_parameters -> get($column_name);
		}
	}
	my $panda = $rs -> create($payload) || send_error('bad panda, bad panda!', 400);
	return {$panda->get_columns};
};

# RETRIEVE
get '/panda/:name' => sub {
	my $panda_name = params -> {'name'} or die 'No panda name given!';
	my $panda = schema -> resultset('Pandas') -> find($panda_name);
	send_error('Sorry, this is not the panda you are looking for', 404) unless $panda;
	return {$panda->get_columns};
};

put '/panda/:name' => sub {
	my $panda_name = params -> {'name'} or die 'No panda name given!';
	my $panda = schema -> resultset('Pandas') -> find($panda_name);
	send_error({'reason' => 'Sorry, no panda here'}, 404) unless $panda;

	$panda -> set_column('description' => body_parameters -> get('description'));
	$panda -> update();
	return {'name' => $panda_name, 'message' => 'updated'};

};

del '/panda/:name' => sub {
	my $panda_name = params -> {'name'} or die 'No panda name given!';
	my $panda = schema -> resultset('Pandas') -> find($panda_name);
	send_error({'reason' => 'Sorry, no panda here'}, 404) unless $panda;

	$panda -> delete();
	return {'name' => $panda_name, 'message' => 'deleted'};

};

true;
