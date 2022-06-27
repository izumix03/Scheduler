package Scheduler::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;
use Time::Piece;

any '/' => sub {
    my ($c) = @_;
    my @schedules = $c->model('Schedule')->all($c->req->parameters->{order});

    return $c->render('index.tx', { schedules => \@schedules });
};

get '/user' => sub {
    my ($c) = @_;
    return $c->render('user.tx', {
        name  => "takahiro",
        hobby => "training",
        age   => 36
    });
};

post '/post' => sub {
    my ($c) = @_;
    my $title = $c->req->parameters->{title};
    my $date = $c->req->parameters->{date};

    my $date_epoch = Time::Piece->strptime($date, '%Y/%m/%d')->epoch;
    $c->db->insert(schedules => {
        title => $title,
        date  => $date_epoch,
    });

    return $c->redirect('/');
};

post '/schedules/:id/delete' => sub {
    my ($c, $args) = @_;
    my $id = $args->{id};

    $c->db->delete('schedules' => { id => $id });
    return $c->redirect('/');
};

post '/account/logout' => sub {
    my ($c) = @_;
    $c->session->expire();
    return $c->redirect('/');
};

1;
