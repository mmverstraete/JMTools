"""
    mroot_misrhr, misr_path, misr_block, misrhr_prdct, misrhr_subprdct = split_misrhr_fpath_tst_2()

# Purpose(s):
* Generate the output of `split_misrhr_fpath.jl` for testing purposes. Test 2: L1B3 file.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `mroot_misrhr::AbstractString`: The root directory for MISR-HR product files.
* `misr_path::Integer`: The MISR Path number.
* `misr_block::Integer`: The MISR Block number.
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.
* `misrhr_subprdct::AbstractString`: The MISR-HR subproduct acronym (only for TIP products).

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

julia> include(JMTools_test * "src/split_misrhr_fpath_tst_2.jl")
split_misrhr_fpath_tst_2

julia> mroot_misrhr, misr_path, misr_block, misrhr_prdct, misrhr_subprdct = split_misrhr_fpath_tst_2();

julia> @test mroot_misrhr == "/Volumes/MISR-HR/"
Test Passed

julia> @test misr_path == 168
Test Passed

julia> @test misr_block == 111
Test Passed

julia> @test misrhr_prdct == "L1B3"
Test Passed

julia> @test misrhr_subprdct == ""
Test Passed
```
"""
function split_misrhr_fpath_tst_2(
    )::Tuple{AbstractString, Integer, Integer, AbstractString, AbstractString}

    misrhr_fpath = "/Volumes/MISR-HR/P168/B111/L1B3/"
    mroot_misrhr, misr_path, misr_block, misrhr_prdct, misrhr_subprdct =
        split_misrhr_fpath(misrhr_fpath)

    return mroot_misrhr, misr_path, misr_block, misrhr_prdct, misrhr_subprdct

end
