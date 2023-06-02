"""
    mroot_misr, misr_path, misr_prdct = split_misr_fpath_tst_1300()

# Purpose(s):
Generate the output of `split_misr_fpath.jl` for testing purposes. Test 1300: For a MISR L1RTGM file.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `mroot_misr::AbstractString`: The root directory for MISR data files.
* `misr_path::Integer`: The MISR Path number.
* `misr_prdct::AbstractString`: The MISR product acronym.

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

julia> include(JMTools_test * "src/split_misr_fpath_tst_1300.jl")
split_misr_fpath_tst_1300

julia> mroot_misr, misr_path, misr_prdct = split_misr_fpath_tst_1300();

julia> @test mroot_misr == "/Volumes/MISR_Data0/"
Test Passed

julia> @test misr_path == 168
Test Passed

julia> @test misr_prdct == "L1RTGM"
Test Passed
```
"""
function split_misr_fpath_tst_1300(
    )::Tuple{AbstractString, Integer, AbstractString}

    misr_fpath = "/Volumes/MISR_Data0/P168/L1RTGM"
    mroot_misr, misr_path, misr_prdct = split_misr_fpath(misr_fpath)

    return mroot_misr, misr_path, misr_prdct

end
