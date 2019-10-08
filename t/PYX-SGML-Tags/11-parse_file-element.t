use strict;
use warnings;

use File::Object;
use PYX::SGML::Tags;
use Tags::Output::Raw;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Directories.
my $data_dir = File::Object->new->up->dir('data');

# Test.
my $tags = Tags::Output::Raw->new(
	'xml' => 1,
);
my $obj = PYX::SGML::Tags->new(
	'tags' => $tags,
);
$obj->parse_file($data_dir->file('element1.pyx')->s);
is($tags->flush, "<element />");

# Test.
$tags->reset;
$obj->parse_file($data_dir->file('element2.pyx')->s);
is($tags->flush, "<element par=\"val\" />");

# Test.
$tags->reset;
$obj->parse_file($data_dir->file('element3.pyx')->s);
is($tags->flush, "<element par=\"val\\nval\" />");
