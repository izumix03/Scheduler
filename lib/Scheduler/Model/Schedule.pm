package Scheduler::Model::Schedule;
use strict;
use warnings FATAL => 'all';
use utf8;

use parent qw/Scheduler::Model/;

# raild like なモデル？モデルじゃない気がするけどMouse入れるまでは記事通りこれはModelと命名
sub all {
    my ($class, $order_param) = @_;

    my $order = lc ($order_param || '') eq 'reverse' ? 'date' : 'date DESC';

    return $class->db->search('schedules', {}, { order_by => $order });
}
1;