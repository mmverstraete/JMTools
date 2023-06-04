"""
    misrhr_fspec = make_misrhr_fspec_tst_L1B316868050110()

# Purpose(s):
* Generate the output of `make_misrhr_fspec.jl` for testing purposes. Test L1B316868050110: For a MISR-HR L1B3 file, Path 168, Orbit 68050, Block 110.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misrhr_fspec::Vector{AbstractString}`: A `Vector` of one or nine specification(s) for the MISR-HR product file(s) correponding to the input arguments.

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

julia> include(JMTools_test * "src/make_misrhr_fspec_tst_L1B316868050110.jl")
make_misrhr_fspec_tst_L1B316868050110

julia> misrhr_fspec = make_misrhr_fspec_tst_L1B316868050110();

julia> @test misrhr_fspec == [
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.B110_MISRHR_V2.02-0.hdf",
    "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.B110_MISRHR_V2.02-0.hdf"]
 Test Passed
```
"""
function make_misrhr_fspec_tst_L1B316868050110(
    )::Vector{AbstractString}

    misrhr_fspec = make_misrhr_fspec("L1B3", 168, 68050, 110;
        misrhr_subprdct = "radrd", misr_camera = "*",
        misrhr_fpath = "~/mypath")

    return misrhr_fspec

end
