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

#- hack ------------------------------------------------------------------------
# To allow version fetching
unit module Native::Overflow:ver<0.0.3>:auth<zef:lizmat>;

# vim: expandtab shiftwidth=4
