#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Dancer::Plugin::ChangeSessionID' ) || print "Bail out!\n";
}

diag( "Testing Dancer::Plugin::ChangeSessionID $Dancer::Plugin::ChangeSessionID::VERSION, Perl $], $^X" );
