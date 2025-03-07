package Daje::Plugin::Login;
use Mojo::Base 'Mojolicious::Plugin', -signatures;
use v5.40;

# NAME
# ====
#
# Daje::Plugin::Login - It's new $module
#
# SYNOPSIS
# ========
#
#     use Daje::Plugin::Login;
#
# DESCRIPTION
# ===========
#
# Daje::Plugin::Login is ...
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


sub register ($self, $app, $config) {

    my $r = $app->routes();
    $r->put('/api/login/')->to('login#login_user');

    $app->helper(login => sub {$login});

    $app->log->debug("Daje::Plugin::Workflow registered");
}

1;
__END__



