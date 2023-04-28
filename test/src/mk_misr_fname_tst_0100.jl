"""
    misr_fname = mk_misr_fname_tst_0100()

# Purpose:
Generate the output of `mk_misr_fname.jl` for testing purposes. Test 0100: For a MISR AGP file, using only the required positional arguments.

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

julia> include(JMTools_test * "src/mk_misr_fname_tst_0100.jl")
mk_misr_fname_tst_0100

julia> misr_fname = mk_misr_fname_tst_0100()
"MISR_AM1_AGP_P168_F01_24.hdf"

julia> @test misr_fname == "MISR_AM1_AGP_P168_F01_24.hdf"
Test Passed
```
"""
function mk_misr_fname_tst_0100()
    misr_prdct = "AGP"
    misr_path = 168
    misr_fname = mk_misr_fname(misr_prdct, misr_path)
    return misr_fname
end
