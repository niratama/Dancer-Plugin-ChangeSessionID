use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Dancer::Plugin::ChangeSessionID',
    AUTHOR              => q{Kenichi Kobayashi <niratama3@gmail.com>},
    VERSION_FROM        => 'lib/Dancer/Plugin/ChangeSessionID.pm',
    ABSTRACT_FROM       => 'lib/Dancer/Plugin/ChangeSessionID.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Dancer::Plugin' => 0,
        'Dancer::Session' => 0,
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Dancer-Plugin-ChangeSessionID-*' },
);
