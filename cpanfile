requires "Dancer2" => "0.205000";
requires "Dancer2::Plugin::DBIC";
requires "Plack";
requires "Plack::Middleware::Deflater";

recommends "YAML"             => "0";
recommends "URL::Encode::XS"  => "0";
recommends "CGI::Deurl::XS"   => "0";
recommends "HTTP::Parser::XS" => "0";

on "test" => sub {
    requires "Test::More"            => "0";
    requires "HTTP::Request::Common" => "0";
};
