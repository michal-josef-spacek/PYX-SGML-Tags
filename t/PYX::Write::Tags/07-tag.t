# Pragmas.
use strict;
use warnings;

# Modules.
use File::Object;
use PYX::Write::Tags;
use Tags::Output::Raw;
use Test::More 'tests' => 3;

# Directories.
my $data_dir = File::Object->new->up->dir('data')->serialize;

# Include helpers.
do File::Object->new->up->file('get_stdout.inc')->serialize;

print "Testing: Tag writing.\n";
my $tags = Tags::Output::Raw->new(
	'xml' => 1,
);
my $obj = PYX::Write::Tags->new(
	'tags_obj' => $tags,
);
get_stdout($obj, "$data_dir/tag1.pyx");
is($tags->flush, "<tag />");

$tags->reset;
get_stdout($obj, "$data_dir/tag2.pyx");
is($tags->flush, "<tag par=\"val\" />");

$tags->reset;
get_stdout($obj, "$data_dir/tag3.pyx");
is($tags->flush, "<tag par=\"val\\nval\" />");
