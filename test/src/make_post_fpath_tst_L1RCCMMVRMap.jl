"""
    post_fpath = make_post_fpath_tst_L1RCCMMVRMap()

# Purpose(s):
* Generate the output of `make_post_fpath.jl` for testing purposes. Test L1RCCMMVRMap: For the `"L1RCCMMVRMap"` product.

# Positional argument(s): None.

# Keyword argument(s): None:

# Return value(s):
* `post_fpath::AbstractString`: The full name of the directory when no arguments are provided.

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

julia> include(JMTools_test * "src/make_post_fpath_tst_L1RCCMMVRMap.jl")
make_post_fpath_tst_L1RCCMMVRMap

julia> post_fpath = make_post_fpath_tst_L1RCCMMVRMap();

julia> @test post_fpath == "/Users/michel/Projects/MISR/Scrap/U=John/P=Test/P168-P170+O068000-O072000+B110-B112+SITE_SKUKUZA/make_post_fpath/L1RCCMMVR/Map/"
Test Passed
```
"""
function make_post_fpath_tst_L1RCCMMVRMap(
    )::AbstractString

    set_mroots("Reset")
    location = make_location(;
        misr_path1 = 168, misr_path2 = 170,
        misr_orbit1 = 68000, misr_orbit2 = 72000,
        misr_block1 = 110, misr_block2 = 112,
        misr_site = "Skukuza")
    post_fpath = make_post_fpath(; user = "John", project = "Test", location = location,
        prdct = "L1RCCMMVR", ftype = "Map")

    return post_fpath

end
