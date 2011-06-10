package Dancer::Plugin::ChangeSessionID;

use strict;
use warnings;

our $VERSION = '0.01';

use Dancer::Plugin;

use Dancer::Session;

register change_sessoin_id => sub {
	my $engine	= Dancer::Session::engine;
	my $sid 	= $engine->read_session_id;
	my $session = undef;
	my $class	= ref($engine);

	if ($sid) {
		$session = $class->retrieve($sid);
		$session->destroy;
		my $new_sid = $engine->build_id;
		$session->id($new_sid);
		$engine->write_session_id($new_sid);
		$session->flush;
	}
};

register_plugin;
1;
__END__
=pod

=head1 NAME

Dancer::Plugin::ChangeSessionID - 

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

	use Dancer;
	use Dancer::Plugin::ChangeSessionID;
	
	get '/foo' => sub {
		# old session id
		change_session_id;
		# new session id
	};

=head1 SUBROUTINES/METHODS

=head2 change_session_id

=head1 AUTHOR

Kenichi Kobayashi, C<< <niratama3 at gmail.com> >>

=head1 SEE ALSO

L<Dancer> L<Dancer::Session>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Kenichi Kobayashi.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

See http://dev.perl.org/licenses/ for more information.

=cut
