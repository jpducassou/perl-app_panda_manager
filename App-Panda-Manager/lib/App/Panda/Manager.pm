package App::Panda::Manager;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'App::Panda::Manager' };
};

true;
