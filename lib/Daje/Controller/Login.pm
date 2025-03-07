package Daje::Controller::Login;
use Mojo::Base 'Mojolicious::Controller', -signatures;
use v5.40;


# NAME
# ====
#
# Daje::Controller::Login - It's new controller to manage login
#
# SYNOPSIS
# ========
#
#     use Daje::Controller::Login;
#
# DESCRIPTION
# ===========
#
# Daje::Controller::Login is ...
#
# LICENSE
# =======
#
# Copyright (C) janeskil1525.
#
# This library is free software; you can redistribute it and/or modify
# it under the same terms as Perl itself.
#
# AUTHOR
# ======
#
# janeskil1525 E<lt>janeskil1525@gmail.comE<gt>
#

our $VERSION = "0.01";

sub login($self) {

    say "Login user";
    $self->render_later;

    my $data = from_json($self->req->body);
    $self->login->login_user($data->{username}, $data->{password})->then(sub ($result) {
        say "Place 1 " . Dumper($result);
        if($result) {
            $self->render(json => {'result' => "success", data => $result});
        } else {
            $self->render(json => {'result' => "failed", data => $result});
        }
    })->catch(sub ($err) {
        say "Error " . Dumper($err);
        $self->render(json => {'result' => $err});
    })->wait;
}

1;
__END__



#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME


Daje::Controller::Login - It's new controller to manage login



=head1 SYNOPSIS


    use Daje::Controller::Login;



=head1 DESCRIPTION


Daje::Controller::Login is ...



=head1 REQUIRES

L<v5.40> 

L<Mojo::Base> 


=head1 METHODS


=head1 AUTHOR


janeskil1525 E<lt>janeskil1525@gmail.comE<gt>



=head1 LICENSE


Copyright (C) janeskil1525.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.



=cut

