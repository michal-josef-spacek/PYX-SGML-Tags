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
$obj->parse_file($data_dir->file('char1.pyx')->s);
is($tags->flush, "char", 'Simple character.');
$tags->reset;

# Test.
$obj->parse_file($data_dir->file('char2.pyx')->s);
is($tags->flush, "char\nchar", 'Character with newline.');
$tags->reset;

# Test.
$obj->parse_file($data_dir->file('char3.pyx')->s);
is($tags->flush, "charchar", 'Two data characters.');
$tags->reset;
