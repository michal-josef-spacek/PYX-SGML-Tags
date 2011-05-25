# Modules.
use File::Object;
use PYX::Write::Tags2;
use Tags2::Output::Raw;
use Test::More 'tests' => 3;

# Directories.
my $data_dir = File::Object->new->up->dir('data')->serialize;

# Include helpers.
do File::Object->new->up->file('get_stdout.inc')->serialize;

print "Testing: Tag writing.\n";
my $tags2 = Tags2::Output::Raw->new(
	'xml' => 1,
);
my $obj = PYX::Write::Tags2->new(
	'tags_obj' => $tags2,
);
get_stdout($obj, "$data_dir/tag1.pyx");
is($tags2->flush, "<tag />");

$tags2->reset;
get_stdout($obj, "$data_dir/tag2.pyx");
is($tags2->flush, "<tag par=\"val\" />");

$tags2->reset;
get_stdout($obj, "$data_dir/tag3.pyx");
is($tags2->flush, "<tag par=\"val\\nval\" />");
