"""
    prdct_version = set_current_prdct_version_tst_0100()

# Purpose:
Generate the output of `set_current_prdct_version.jl` for testing purposes. Test 0100: For a MISR `AGP` data product.

# Positional argument(s): None.

# Keyword argument(s): None.

# Returned value(s):
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

julia> include(JMTools_test * "src/set_current_prdct_version_tst_0100.jl")
set_current_prdct_version_tst_0100

julia> prdct_version = set_current_prdct_version_tst_0100();

julia> @test prdct_version == "F01_24"
Test Passed
```
"""
function set_current_prdct_version_tst_0100()
    misr_prdct = "AGP"
    prdct_version = set_current_prdct_version(misr_prdct)
    return prdct_version
end
