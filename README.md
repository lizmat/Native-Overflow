[![Actions Status](https://github.com/lizmat/Native-Overflow/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Native-Overflow/actions) [![Actions Status](https://github.com/lizmat/Native-Overflow/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Native-Overflow/actions) [![Actions Status](https://github.com/lizmat/Native-Overflow/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Native-Overflow/actions)

NAME
====

Native::Overflow - lexically enforce overflow checking on natives

SYNOPSIS
========

```raku
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
```

DESCRIPTION
===========

`Native::Overflow` provides a number of `subsets` with the same names as built-in native types that provide overflow checking (which native types do **not** perform by design).

It is mostly intended as a debugging tool, as usage will thwart any efficiency gains of using real native integer variables.

By default the `int8`, `int16`, `int32`, `int64`, `uint64`, `uint32`, `uint16`, `uint8`, `byte` subsets are imported.

The `int1`, `int2` `int4`, `uint4`, `nibble`, `uint2`, `uint1`, `bit` subsets can be optionally imported (these may at one point become available as native types in Raku).

Inspired by [a Rakudo issue](https://github.com/rakudo/rakudo/issues/1725).

BUGS
====

Apparently some issue in Rakudo in release 2024.09 and earlier is causing the handling of `int32`, `int64`, `uint64` and `uint32` to fail.

Another issue in the new Raku grammar (aka RakuAST) is causing this module to fail completely at import.

It is hoped that these issues will be resolved in the future.s

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Native-Overflow . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

