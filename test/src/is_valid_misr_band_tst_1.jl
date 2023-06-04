"""
    bool = is_valid_misr_band_tst_1()

# Purpose(s):
* Generate the output of `is_valid_misr_band.jl` for testing purposes. Test 1: For the Blue band.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misr_band` is valid or not.

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

julia> include(JMTools_test * "src/is_valid_misr_band_tst_1.jl")
is_valid_misr_band_tst_1

julia> bool = is_valid_misr_band_tst_1();

julia> @test bool == true
Test Passed
```
"""
function is_valid_misr_band_tst_1(
    )::Bool

    bool = is_valid_misr_band("Blue")

    return bool

end
