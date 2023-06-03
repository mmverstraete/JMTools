"""
    misr_fspec = make_misr_fspec_tst_1300()

# Purpose(s):
* Generate the output of `make_misr_fpath.jl` for testing purposes. Test 1300: For a MISR L1RTGM file.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misr_fspec::Vector{AbstractString}`: The specification(s) (path(s) and name(s)) of the MISR data file(s) correponding to the input arguments.

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

julia> include(JMTools_test * "src/make_misr_fspec_tst_1300.jl")
make_misr_fspec_tst_1300

julia> misr_fspec = make_misr_fspec_tst_1300();

julia> @test misr_fspec[1] == "/Volumes/MISR_Data0/P168/L1RTGM/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
Test Passed
```
"""
function make_misr_fspec_tst_1300(
    )::Vector{AbstractString}

    misr_fspec = make_misr_fspec("L1RTGM", 168;
        misr_orbit = 68050, misr_camera = "AN", misr_site = "", misr_version = "")

    return misr_fspec

end
