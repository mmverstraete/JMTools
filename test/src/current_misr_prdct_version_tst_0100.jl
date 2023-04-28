"""
    misr_prdct_version = current_misr_prdct_version_tst_0100()

# Purpose:
Generate the output of `current_misr_prdct_version.jl` for testing purposes. Test 0100: For a MISR `AGP` file.

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

julia> include(JMTools_test * "src/current_misr_prdct_version_tst_0100.jl")
current_misr_prdct_version_tst_0100

julia> misr_prdct_version = current_misr_prdct_version_tst_0100();

julia> @test misr_prdct_version == "F01_24"
Test Passed
```
"""
function current_misr_prdct_version_tst_0100()
    misr_prdct = "AGP"
    misr_prdct_version = current_misr_prdct_version(misr_prdct)
    return misr_prdct_version
end
