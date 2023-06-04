"""
    misrhr_fspec = make_misrhr_fspec_tst_BRF16868050110()

# Purpose(s):
* Generate the output of `make_misrhr_fspec.jl` for testing purposes. Test BRF16868050110: For a MISR-HR BRF file, Path 168, Orbit 68050, Block 110.

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

julia> include(JMTools_test * "src/make_misrhr_fspec_tst_BRF16868050110.jl")
make_misrhr_fspec_tst_BRF16868050110

julia> misrhr_fspec = make_misrhr_fspec_tst_BRF16868050110();

julia> @test misrhr_fspec == ["/Volumes/MISR-HR/P168/B110/BRF/brf/MISR_HR_BRF_2012-10-03_P168_O068050_B110_V2.02-0.hdf"]
Test Passed
```
"""
function make_misrhr_fspec_tst_BRF16868050110(
    )::Vector{AbstractString}

    misrhr_fspec = make_misrhr_fspec("BRF", 168, 68050, 110;
        misrhr_subprdct = "brf")

    return misrhr_fspec

end
