# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'TODO';
author 'Michal Spacek <skim@cpan.org>';
license 'bsd';
name 'PYX-Write-Tags';
readme_from 'Tags.pm';
requires 'Class::Utils' => 0.05;
requires 'Error::Pure' => 0.15;
requires 'PYX::Parser' => 0.01;
requires 'PYX::Utils' => 0.01;
requires 'perl' => '5.6.2';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=PYX-Write-Tags';
resources 'homepage' => 'https://github.com/tupinek/PYX-Write-Tags';
resources 'repository' => 'git://github.com/tupinek/PYX-Write-Tags';
test_requires 'English' => 0;
test_requires 'File::Object' => 0.07;
test_requires 'Tags::Output::Raw' => 0;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
