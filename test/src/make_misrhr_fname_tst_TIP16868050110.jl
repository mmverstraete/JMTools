"""
    misrhr_fname = make_misrhr_fname_tst_TIP16868050110()

# Purpose(s):
* Generate the output of `make_misrhr_fname.jl` for testing purposes. Test TIP16868050110: For a MISR-HR TIP file, Path 168, Orbit 68050, Block 110.

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

julia> include(JMTools_test * "src/make_misrhr_fname_tst_TIP16868050110.jl")
make_misrhr_fname_tst_TIP16868050110

julia> misrhr_fname = make_misrhr_fname_tst_TIP16868050110();

julia> @test misrhr_fname[1] == "MISR_HR_TIP_2012-10-03_P168_O068050_B110_V2.02-0_GRN.hdf"
Test Passed
```
"""
function make_misrhr_fname_tst_TIP16868050110(
    )::Vector{AbstractString}

    misrhr_fname = make_misrhr_fname("TIP", 168, 68050, 110)

    return misrhr_fname

end
