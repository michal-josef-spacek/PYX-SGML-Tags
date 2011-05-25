# Pragmas.
use strict;
use warnings;

# Modules.
use File::Object;
use PYX::Write::Tags;
use Tags::Output::Raw;
use Test::More 'tests' => 2;

# Directories.
my $data_dir = File::Object->new->up->dir('data')->serialize;

# Include helpers.
do File::Object->new->up->file('get_stdout.inc')->serialize;

print "Testing: Instruction writing.\n";
my $tags = Tags::Output::Raw->new(
	'xml' => 1,
);
my $obj = PYX::Write::Tags->new(
	'tags_obj' => $tags,
);
get_stdout($obj, "$data_dir/instruction1.pyx");
is($tags->flush, '<?target code?>');

$tags->reset;
get_stdout($obj, "$data_dir/instruction2.pyx");
is($tags->flush, "<?target data\\ndata?>");
