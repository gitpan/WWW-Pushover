use strict;
use Test::More;
use File::Spec;
eval q{ use Test::Spellunker v0.2.2 };
plan skip_all => "Test::Spellunker is not installed." if $@;

plan skip_all => "no ENV[HOME]" unless $ENV{HOME};
my $spelltest_switchfile = ".spellunker.en";
plan skip_all => "no ~/$spelltest_switchfile" unless -e File::Spec->catfile($ENV{HOME}, $spelltest_switchfile);

add_stopwords('WWW-Pushover');
add_stopwords(qw());

all_pod_files_spelling_ok('lib');
