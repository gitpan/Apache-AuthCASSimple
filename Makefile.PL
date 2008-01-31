use inc::Module::Install;
use Apache::src;

name            'Apache-AuthCASSimple';
all_from        'lib/Apache/AuthCASSimple.pm';

requires 'Apache::Constants';
requires 'Apache::ModuleConfig';
requires 'Apache::Log';
requires 'Apache::Session::Wrapper';
requires 'DynaLoader';
requires 'Authen::CAS::Client';

my $apache = Apache::src->new;

inc     $apache->inc();

build_requires  'Apache::src';

auto_install;

install_script('scripts/delete_session_data.pl');

tests('t/*.t');

WriteAll;

