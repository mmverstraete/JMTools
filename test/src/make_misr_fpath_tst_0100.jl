"""
    misr_fpath = make_misr_fpath_tst_0100()

# Purpose(s):
Generate the output of `make_misr_fpath.jl` for testing purposes. Test 0100: For a MISR AGP file.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misr_fpath::AbstractString`: The full name of the directory containing MISR data file(s) for the specified product acronym and Path number.

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

julia> include(JMTools_test * "src/make_misr_fpath_tst_0100.jl")
make_misr_fpath_tst_0100

julia> misr_fpath = make_misr_fpath_tst_0100();

julia> @test misr_fpath == "~/P168/AGP/"
Test Passed
```
"""
function make_misr_fpath_tst_0100(
    )::AbstractString

    misr_prdct = "AGP"
    misr_path = 168

    set_mroots("Unset");
    misr_fpath = make_misr_fpath(misr_prdct, misr_path)
    set_mroots("Reset");

    return misr_fpath

end
