package Pithub::Users::Emails;

# ABSTRACT: Github v3 User Emails API

use Moose;
use Carp qw(croak);
use namespace::autoclean;
extends 'Pithub::Base';

=method add

=over

=item *

Add email address(es)

    POST /user/emails

Examples:

    my $e = Pithub::Users::Emails->new( token => 'b3c62c6' );
    my $result = $e->add( data => [ 'plu@cpan.org', 'plu@pqpq.de' ] );

=back

=cut

sub add {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: data (arrayref)' unless ref $args{data} eq 'ARRAY';
    return $self->request( POST => '/user/emails', $args{data} );
}

=method delete

=over

=item *

Delete email address(es)

    DELETE /user/emails

Examples:

    my $e = Pithub::Users::Emails->new( token => 'b3c62c6' );
    my $result = $e->delete( data => [ 'plu@cpan.org', 'plu@pqpq.de' ] );

=back

=cut

sub delete {
    my ( $self, %args ) = @_;
    croak 'Missing key in parameters: data (arrayref)' unless ref $args{data} eq 'ARRAY';
    return $self->request( DELETE => '/user/emails', $args{data} );
}

=method list

=over

=item *

List email addresses for a user

    GET /user/emails

Examples:

    my $e = Pithub::Users::Emails->new( token => 'b3c62c6' );
    my $result = $e->list;

=back

=cut

sub list {
    my ($self) = @_;
    return $self->request( GET => '/user/emails' );
}

__PACKAGE__->meta->make_immutable;

1;
