# Pragmas.
use strict;
use warnings;

# Modules.
use File::Object;
use PYX::Write::Tags;
use Tags::Output::Raw;
use Test::More 'tests' => 2;

# Directories.
my $data_dir = File::Object->new->up->dir('data');

# Include helpers.
do File::Object->new->up->file('get_stdout.inc')->s;

# Test.
my $tags = Tags::Output::Raw->new(
	'xml' => 1,
);
my $obj = PYX::Write::Tags->new(
	'tags_obj' => $tags,
);
get_stdout($obj, $data_dir->file('instruction1.pyx')->s);
is($tags->flush, '<?target code?>');

# Test.
$tags->reset;
get_stdout($obj, $data_dir->file('instruction2.pyx')->s);
is($tags->flush, "<?target data\\ndata?>");
