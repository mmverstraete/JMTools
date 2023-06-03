"""
    prdct_version = set_current_prdct_version_tst_1000()

# Purpose:
Generate the output of `set_current_prdct_version.jl` for testing purposes. Test 1000: For a MISR `L1GMP` file.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `prdct_version::AbstractString`: The current version label of the specified MISR, MISR-HR or post-processing product acronym.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Example:
```julia
julia> using JMTools

julia> using Test

julia> include(JMTools_test * "src/set_current_prdct_version_tst_1000.jl")
set_current_prdct_version_tst_1000

julia> prdct_version = set_current_prdct_version_tst_1000();

julia> @test prdct_version == "F03_0013"
Test Passed
```
"""
function set_current_prdct_version_tst_1000()
    misr_prdct = "L1GMP"
    prdct_version = set_current_prdct_version(misr_prdct)
    return prdct_version
end
