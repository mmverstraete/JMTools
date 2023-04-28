"""
    misr_fname = mk_misr_fname_tst_0101()

# Purpose:
Generate the output of `mk_misr_fname.jl` for testing purposes. Test 0101: For a MISR AGP file, mentioning also the unnecessary keyword arguments.

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

julia> include(JMTools_test * "src/mk_misr_fname_tst_0101.jl")
mk_misr_fname_tst_0101

julia> misr_fname = mk_misr_fname_tst_0101()
"MISR_AM1_AGP_P168_F01_24.hdf"

julia> @test misr_fname == "MISR_AM1_AGP_P168_F01_24.hdf"
Test Passed
```
"""
function mk_misr_fname_tst_0101()
    misr_prdct = "AGP"
    misr_path = 168
    misr_fname = mk_misr_fname(misr_prdct, misr_path;
        misr_orbit = 0, misr_camera = "", misr_site = "", misr_version = "")
    return misr_fname
end
