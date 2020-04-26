use strict;
use warnings;

use PYX::SGML::Tags;
use Tags::Output::Raw;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $tags = Tags::Output::Raw->new(
	'xml' => 1,
);
my $obj = PYX::SGML::Tags->new(
	'tags' => $tags,
);
my $pyx_data = <<'END';
(element
)element
END
$obj->parse($pyx_data);
is($tags->flush, "<element />");
$tags->reset;

# Test.
$pyx_data = <<'END';
(element
Apar val
)element
END
$obj->parse($pyx_data);
is($tags->flush, "<element par=\"val\" />");
$tags->reset;

# Test.
$pyx_data = <<'END';
(element
Apar val\nval
)element
END
$obj->parse($pyx_data);
is($tags->flush, "<element par=\"val\\nval\" />");
