use strict;
use warnings FATAL => 'all';
use utf8;

package Scheduler::Model::Schedule {
    use Mouse;

    has id => (is => 'ro', isa => 'Int');
    has title => (is => 'ro', isa => 'Str');
    has date => (is => 'ro', isa => 'Time::Piece');

    sub summary_title {
        my $self = shift;
        return substr($self->title, 0, 10);
    }
};

1;