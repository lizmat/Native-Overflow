my subset int1  of Int where                   -1 <= $_ <= 0;
my subset int2  of Int where                   -2 <= $_ <= 1;
my subset int4  of Int where                   -8 <= $_ <= 7;
my subset int8  of Int where                 -128 <= $_ <= 127;
my subset int16 of Int where               -32768 <= $_ <= 32767;
my subset int32 of Int where          -2147483648 <= $_ <= 2147483647;
my subset int64 of Int where -9223372036854775808 <= $_ <= 9223372036854775807;

my subset uint64 of Int where 0 <= $_ <= 18446744073709551615;
my subset uint32 of Int where 0 <= $_ <= 4294967295;
my subset uint16 of Int where 0 <= $_ <= 65535;
my subset uint8  of Int where 0 <= $_ <= 255;
my subset byte   of Int where 0 <= $_ <= 255;
my subset uint4  of Int where 0 <= $_ <= 15;
my subset nibble of Int where 0 <= $_ <= 15;
my subset uint2  of Int where 0 <= $_ <= 3;
my subset uint1  of Int where 0 <= $_ <= 1;
my subset bit    of Int where 0 <= $_ <= 1;

my sub EXPORT(*@types) {
    @types = <int8 int16 int32 int64 uint64 uint32 uint16 uint8 byte>
      unless @types;

    Map.new( @types.map({ $_ => ::($_) }) )
}

=begin pod

=head1 NAME

Native::Overflow - lexically enforce overflow checking on natives

=head1 SYNOPSIS

=begin code :lang<raku>

use Native::Overflow <int8>;

my int16 $a = 1_000_000;  # no overflow check
say $a;  # 16960

my int8 $b = 1000;
# Type check failed in assignment to $c; expected int8 but got Int (100)

# Only override in scope
{
    use Native::Overflow;
    my int16 $c = 1_000_000;
    # Type check failed in assignment to $c; expected int16 but got Int (1000000)
}

=end code

=head1 DESCRIPTION

C<Native::Overflow> provides a number of C<subsets> with the same names as
built-in native types that provide overflow checking (which native types
do B<not> perform by design).

It is mostly intended as a debugging tool, as usage will thwart any
efficiency gains of using real native integer variables.

By default the C<int8>, C<int16>, C<int32>, C<int64>, C<uint64>, C<uint32>,
C<uint16>, C<uint8>, C<byte> subsets are imported.

The C<int1>, C<int2> C<int4>, C<uint4>, C<nibble>, C<uint2>, C<uint1>,
C<bit> subsets can be optionally imported (these may at one point become
available as native types in Raku).

Inspired by L<a Rakudo issue|https://github.com/rakudo/rakudo/issues/1725>.

=head1 BUGS

Apparently some issue in Rakudo in release 2024.09 and earlier is causing
the handling of C<int32>, C<int64>, C<uint64> and C<uint32> to fail.

Another issue in the new Raku grammar (aka RakuAST) is causing this
module to fail completely at import.

It is hoped that these issues will be resolved in the future.s

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Native-Overflow .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
