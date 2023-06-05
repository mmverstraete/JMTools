"""
    bool = is_valid_ftype_tst_Caption()

# Purpose(s):
Generate the output of `is_valid_ftype.jl` for testing purposes. Test Caption: For a file type of `"Caption"`.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `bool::Boolean`: Whether the argument `ftype` is a recognized file type or not.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Example 1:
```julia
julia> using JMTools

julia> using Test

julia> include(JMTools_test * "src/is_valid_ftype_tst_Caption.jl")
is_valid_ftype_tst_Caption

julia> bool = is_valid_ftype_tst_Caption();

julia> @test bool == true
Test Passed
```
"""
function is_valid_ftype_tst_Caption(
    )::Bool

    bool = is_valid_ftype("Caption")

    return bool

end
