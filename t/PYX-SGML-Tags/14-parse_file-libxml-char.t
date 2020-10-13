use strict;
use warnings;

use English;
use File::Object;
use PYX::SGML::Tags;
use Test::More 'tests' => 3;
use Test::NoWarnings;

SKIP: {
	eval {
		require Tags::Output::LibXML;
	};
	if ($EVAL_ERROR) {
		skip "Module 'Tags::Output::LibXML' isn't present.", 2;
	}

	# Directories.
	my $data_dir = File::Object->new->up->dir('data');

	# Test.
	my $tags = Tags::Output::LibXML->new;
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
	is($tags->flush, "char char", 'Two data characters.');
	$tags->reset;
};
