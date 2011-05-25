package PYX::Write::Tags;

# Pragmas.
use strict;
use warnings;

# Modules.
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use PYX::Parser;
use PYX::Utils qw(encode);

# Version.
our $VERSION = 0.01;

# Global variables.
use vars qw($tags @tag);

# Constructor.
sub new {
	my ($class, @params) = @_;
	my $self = bless {}, $class;

	# Tags object.
	$self->{'tags_obj'} = '';

	# Process params.
	set_params($self, @params);

	# If doesn't exist Tags object.
	if (! $self->{'tags_obj'} 
		|| (! $self->{'tags_obj'}->isa('Tags::Output::Indent')
		&& !  $self->{'tags_obj'}->isa('Tags::Output::Raw'))) {

		err "Bad 'Tags::Output::Indent' object ".
			"'$self->{'tags_obj'}'.";
	}

	# PYX::Parser object.
	$self->{'pyx_parser'} = PYX::Parser->new(
		'start_tag' => \&_start_tag,
		'end_tag' => \&_end_tag,
		'data' => \&_data,
		'instruction' => \&_instruction,
		'attribute' => \&_attribute,
		'comment' => \&_comment,
	);

	# Tags object.
	$tags = $self->{'tags_obj'};

	# Tag values.
	@tag = ();

	# Object.
	return $self;
}

# Parse pyx text or array of pyx text.
sub parse {
	my ($self, $pyx, $out) = @_;
	$self->{'pyx_parser'}->parse($pyx, $out);
	return;
}

# Parse file with pyx text.
sub parse_file {
	my ($self, $file) = @_;
	$self->{'pyx_parser'}->parse_file($file);
	return;
}

# Parse from handler.
sub parse_handler {
	my ($self, $input_file_handler, $out) = @_;
	$self->{'pyx_parser'}->parse_handler($input_file_handler, $out);
	return;
}

# Process start of tag.
sub _start_tag {
	my (undef, $tag) = @_;
	$tags->put(['b', $tag]);
	return;
}

# Process end of tag.
sub _end_tag {
	my (undef, $tag) = @_;
	$tags->put(['e', $tag]);
	return;
}

# Process data.
sub _data {
	my (undef, $data) = @_;
	$tags->put(['d', encode($data)]);
	return;
}

# Process attribute.
sub _attribute {
	my (undef, $attr, $value) = @_;
	$tags->put(['a', $attr, $value]);
	return;
}

# Process instruction tag.
sub _instruction {
	my (undef, $target, $code) = @_;
	$tags->put(['i', $target, $code]);
	return;
}

# Process comments.
sub _comment {
	my (undef, $comment) = @_;
	$tags->put(['c', encode($comment)]);
	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

PYX::Write::Tags - TODO

=head1 SYNOPSIS

TODO

=head1 METHODS

=over 8

=item B<new()>

Constructor.

=over 8

=item * B<tags_obj>

 TODO

=back

=item B<parse()>

TODO

=item B<parse_file()>

TODO

=item B<parse_handler()>

TODO

=back

=head1 ERRORS

 Mine:
   TODO

 From Class::Utils::set_params():
   Unknown parameter '%s'.

=head1 EXAMPLE

TODO

=head1 DEPENDENCIES

L<Class::Utils(3pm)>,
L<Error::Pure(3pm)>,
L<PYX::Parser(3pm)>,
L<PYX::Utils(3pm)>

=head1 SEE ALSO

 TODO

=head1 AUTHOR

Michal Špaček L<tupinek@gmail.com>

=head1 VERSION

0.01

=cut
