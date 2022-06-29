package Scheduler::Repository::Schedule;
use strict;
use warnings FATAL => 'all';
use utf8;

use parent qw/Scheduler::Repository/;
use Scheduler::Model::Schedule;

sub all {
    my ($class, $order_param) = @_;

    my $order = lc($order_param || '') eq 'reverse' ? 'date' : 'date DESC';

    return map {
        Scheduler::Model::Schedule->new(
            id => $_->id,
            title => $_->title,
            date => $_->date
        )
    } $class->db->search('schedules', {}, { order_by => $order })->all;
}

1;