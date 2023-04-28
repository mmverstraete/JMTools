"""
    misr_prdct_version = current_misr_prdct_version_tst_1000()

# Purpose:
Generate the output of `current_misr_prdct_version.jl` for testing purposes. Test 1000: For a MISR `L1GMP` file.

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

julia> include(JMTools_test * "src/current_misr_prdct_version_tst_1000.jl")
current_misr_prdct_version_tst_1000

julia> misr_prdct_version = current_misr_prdct_version_tst_1000();

julia> @test misr_prdct_version == "F03_0013"
Test Passed
```
"""
function current_misr_prdct_version_tst_1000()
    misr_prdct = "L1GMP"
    misr_prdct_version = current_misr_prdct_version(misr_prdct)
    return misr_prdct_version
end
