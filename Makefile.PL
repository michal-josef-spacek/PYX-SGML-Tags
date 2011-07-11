# Pragmas.
use strict;
use warnings;

# Modules.
use ExtUtils::MakeMaker;

# Definition.
WriteMakefile(
	'AUTHOR' => 'Michal Špaček <skim@cpan.org>',
	'BUILD_REQUIRES' => {
		'English' => 0,
		'File::Object' => 0,
		'Tags::Output::Raw' => 0,
		'Test::More' => 0,
		'Test::Pod' => 0,
		'Test::Pod::Coverage' => 0,
	},
	'CONFIGURE_REQUIRES' => {
		'ExtUtils::MakeMaker' => 0,
	},
	'EXE_FILES' => [
		'bin/pyx2xml_tags',
	],
	'LICENSE' => 'bsd',
	'NAME' => 'PYX::Write::Tags',
	'PREREQ_PM' => {
		'Class::Utils' => 0.01,
		'Error::Pure' => 0.01,
		'PYX::Parser' => 0,
		'PYX::Utils' => 0,
	},
	'VERSION_FROM' => 'Tags.pm',
	'test' => {
		'TESTS' => 't/PYX::Write::Tags/*.t',
	},
);
