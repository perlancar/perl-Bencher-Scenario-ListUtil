package Bencher::Scenario::ListUtil;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark List::Util (XS) vs PP implementation(s)',

    description => <<'_',

EARLY VERSION, ONLY A FEW FUNCTIONS HAVE BEEN BENCHMARKED.

For max*/min*, in general the XS version are about 3x faster than PP.

_

    participants => [
        # max
        {
            tags => ['numeric'],
            fcall_template => 'List::Util::max(@{<list>})',
        },
        {
            tags => ['numeric'],
            fcall_template => 'PERLANCAR::List::Util::PP::max(@{<list>})',
        },
        # maxstr
        {
            tags => ['stringy'],
            fcall_template => 'List::Util::maxstr(@{<list>})',
        },
        {
            tags => ['stringy'],
            fcall_template => 'PERLANCAR::List::Util::PP::maxstr(@{<list>})',
        },

        # min
        {
            tags => ['numeric'],
            fcall_template => 'List::Util::min(@{<list>})',
        },
        {
            tags => ['numeric'],
            fcall_template => 'PERLANCAR::List::Util::PP::min(@{<list>})',
        },
        # minstr
        {
            tags => ['stringy'],
            fcall_template => 'List::Util::minstr(@{<list>})',
        },
        {
            tags => ['stringy'],
            fcall_template => 'PERLANCAR::List::Util::PP::minstr(@{<list>})',
        },

    ],

    datasets => [
        {
            name => 'num10',
            args => {
                list => [2..5, 1,10, 6..9],
            },
        },
        {
            name => 'num100',
            args => {
                list => [2..50, 1,100, 51..99],
            },
        },
        {
            name => 'num1000',
            args => {
                list => [2..500, 1,1000, 501..999],
            },
        },

        {
            name => 'str10',
            args => {
                list => ['b'..'e', 'a','j', 'f'..'i'],
            },
            exclude_participant_tags => ['numeric'],
        },
        {
            name => 'str100', # aa..dv
            args => {
                list => ['ab'..'bx', 'aa','dv', 'by'..'du'],
            },
            exclude_participant_tags => ['numeric'],
        },
        {
            name => 'str1000', # aaa..bml
            args => {
                list => ['aab'..'atf', 'aaa','bml', 'atg'..'bmk'],
            },
            exclude_participant_tags => ['numeric'],
        },
    ],
};

1;
# ABSTRACT:
