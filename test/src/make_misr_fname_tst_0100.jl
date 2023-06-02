"""
    misr_fname = make_misr_fname_tst_0100()

# Purpose(s):
* Generate the output of `make_misr_fname.jl` for testing purposes. Test 0100: For a MISR AGP file, using only the required positional arguments.

# Positional argument(s): None.

# Keyword argument(s): None.

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

julia> include(JMTools_test * "src/make_misr_fname_tst_0100.jl")
make_misr_fname_tst_0100

julia> misr_fname = make_misr_fname_tst_0100()
"MISR_AM1_AGP_P168_F01_24.hdf"

julia> @test misr_fname == "MISR_AM1_AGP_P168_F01_24.hdf"
Test Passed
```
"""
function make_misr_fname_tst_0100()
    misr_prdct = "AGP"
    misr_path = 168
    misr_fname = make_misr_fname(misr_prdct, misr_path)

    return misr_fname

end
