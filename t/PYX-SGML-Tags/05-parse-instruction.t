use strict;
use warnings;

use PYX::SGML::Tags;
use Tags::Output::Raw;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $tags = Tags::Output::Raw->new(
	'xml' => 1,
);
my $obj = PYX::SGML::Tags->new(
	'tags' => $tags,
);
$obj->parse('?target code');
is($tags->flush, '<?target code?>');
$tags->reset;

# Test.
$obj->parse('?target data\ndata');
is($tags->flush, "<?target data\\ndata?>");
$tags->reset;
