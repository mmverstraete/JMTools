"""
    misrhr_fpath = make_misrhr_fpath_tst_L1B3168110_1()

# Purpose(s):
* Generate the output of `make_misrhr_fpath.jl` for testing purposes. Test L1B3168110_1: For a MISR-HR L1B3 file, Path 168, Block 110, case 1.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misrhr_fpath::AbstractString`: The full name of the directory containing MISR-HR data file(s) for the specified product, Path and Block numbers.

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

julia> include(JMTools_test * "src/make_misrhr_fpath_tst_L1B3168110_1.jl")
make_misrhr_fpath_tst_L1B3168110_1

julia> misrhr_fpath = make_misrhr_fpath_tst_L1B3168110_1();

julia> @test misrhr_fpath == "~/P168/B110/L1B3/"
Test Passed
```
"""
function make_misrhr_fpath_tst_L1B3168110_1(
    )::AbstractString

    set_mroots("Unset");
    misrhr_fpath = make_misrhr_fpath("L1B3", 168, 110)

    return misrhr_fpath

end
