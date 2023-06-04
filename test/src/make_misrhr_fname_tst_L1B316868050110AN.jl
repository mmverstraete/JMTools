"""
    misrhr_fname = make_misrhr_fname_tst_L1B316868050110AN()

# Purpose(s):
* Generate the output of `make_misrhr_fname.jl` for testing purposes. Test L1B316868050110AN: For a MISR-HR L1B3 file, Path 168, Orbit 68050, Block 110, Camera AN.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misrhr_fname::AbstractString`: A `Vector` of strings containing the name(s) of the MISR-HR product file(s) corresponding to the arguments.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s): None.

# Example 1:
```julia
julia> using JMTools

julia> using Test

julia> include(JMTools_test * "src/make_misrhr_fname_tst_L1B316868050110AN.jl")
make_misrhr_fname_tst_L1B316868050110AN

julia> misrhr_fname = make_misrhr_fname_tst_L1B316868050110AN()
1-element Vector{AbstractString}:
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.00-1.hdf"

julia> @test misrhr_fname[1] ==
           "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.00-1.hdf"
Test Passed
```
"""
function make_misrhr_fname_tst_L1B316868050110AN(
    )::Vector{AbstractString}

    misrhr_fname = make_misrhr_fname("L1B3", 168, 68050, 110;
        misr_camera = "AN", misrhr_version = "V2.00-1")

    return misrhr_fname

end
