package Scheduler::Model;
use strict;
use warnings;
use utf8;
use Amon2::Declare;

sub new {
    shift;
}

sub db {
    c->db;
}

1;