#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use t::Util;

subtest 'all_1 data found' => sub {
    t::Util::reset_db;
    BEGIN {use_ok('Scheduler');}
    BEGIN {use_ok('Scheduler::Model::Schedule');}
    my $c = Scheduler->bootstrap;

    $c->db->insert(schedules => {
        title => "tilte",
        date  => "1111",
    });

    is(scalar @{$c->model('Schedule')->all('')}, 1, '1 schedule found');
};

subtest 'all_登録されていないので0件取得' => sub {
    t::Util::reset_db;
    BEGIN {use_ok('Scheduler');}
    BEGIN {use_ok('Scheduler::Model::Schedule');}
    my $c = Scheduler->bootstrap;

    is(scalar @{$c->model('Schedule')->all('')}, 0, 'no schedule found');
};

done_testing();

