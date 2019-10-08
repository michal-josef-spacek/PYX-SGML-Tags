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
my $pyx_data =<<'END';
(tag
)tag
END
$obj->parse($pyx_data);
is($tags->flush, "<tag />");
$tags->reset;

# Test.
$pyx_data =<<'END';
(tag
Apar val
)tag
END
$obj->parse($pyx_data);
is($tags->flush, "<tag par=\"val\" />");
$tags->reset;

# Test.
$pyx_data =<<'END';
(tag
Apar val\nval
)tag
END
$obj->parse($pyx_data);
is($tags->flush, "<tag par=\"val\\nval\" />");
