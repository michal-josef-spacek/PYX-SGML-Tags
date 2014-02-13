# Pragmas.
use strict;
use warnings;

# Modules.
use PYX::Write::Tags;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($PYX::Write::Tags::VERSION, 0.01, 'Version.');
