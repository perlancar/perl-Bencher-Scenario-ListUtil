package Bencher::Scenario::ListMoreUtils;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    participants => [
        # uniq
        {
            tags => ['arg1'],
            fcall_template => 'List::MoreUtils::PP::uniq(@{<list>})',
        },
        {
            tags => ['arg1'],
            module => 'List::MoreUtils::XS',
            function => 'uniq',
            code_template => 'List::MoreUtils::uniq(@{<list>})',
        },

        # minmax
        {
            tags => ['arg1'],
            fcall_template => 'List::MoreUtils::PP::minmax(@{<list>})',
        },
        {
            tags => ['arg1'],
            module => 'List::MoreUtils::XS',
            function => 'minmax',
            code_template => 'List::MoreUtils::minmax(@{<list>})',
        },

        # first
        {
            tags => ['arg1'],
            module   => 'List::MoreUtils::PP',
            function => 'firstidx',
            code_template => 'List::MoreUtils::PP::firstidx(sub{$_==-1}, @{<list>})',
        },
        {
            tags => ['arg1'],
            module   => 'List::MoreUtils::XS',
            function => 'firstidx',
            code_template => 'List::MoreUtils::firstidx(sub{$_==-1}, @{<list>})',
        },
    ],

    datasets => [
        {
            name => 'num10',
            args => {
                list => [1..9,1],
            },
            include_participant_tags => ['arg1'],
        },
        {
            name => 'num100',
            args => {
                list => [1..99,1],
            },
            include_participant_tags => ['arg1'],
        },
        {
            name => 'num1000',
            args => {
                list => [1..999,1],
            },
            include_participant_tags => ['arg1'],
        },
    ],
};

1;
# ABSTRACT: Benchmark List::MoreUtils::PP vs List::MoreUtils::XS

=head1 SYNOPSIS

 % bencher -m ListMoreUtils [other options]...


=head1 DESCRIPTION

B<EARLY VERSION, ONLY A FEW FUNCTIONS HAVE BEEN BENCHMARKED>
