"""
    misr_fspec = make_misr_fspec_tst_1301()

# Purpose(s):
* Generate the output of `make_misr_fpath.jl` for testing purposes. Test 1301: For a MISR L1RTGM file, with an alternate `misr_fpath`.

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

julia> include(JMTools_test * "src/make_misr_fspec_tst_1301.jl")
make_misr_fspec_tst_1301

julia> misr_fspec = make_misr_fspec_tst_1301();

julia> @test misr_fspec[1] == "my_path/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
Test Passed
```
"""
function make_misr_fspec_tst_1301(
    )::Vector{AbstractString}

    misr_fspec = make_misr_fspec("L1RTGM", 168;
        misr_orbit = 68050, misr_camera = "AN", misr_fpath = "my_path")

    return misr_fspec

end
