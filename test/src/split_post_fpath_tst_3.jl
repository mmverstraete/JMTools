"""
    mroot_post, user, project, location, call_f, prdct, ftype = split_post_fpath_tst_3()

# Purpose(s):
Generate the output of `split_post_fpath.jl` for testing purposes. Test 3: For a more complex path to a MISR Local Site.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `mroot_post::AbstractString`: The root directory for post-processing product files.
* `user::AbstractString`: The user name.
* `project::AbstractString`: The project name.
* `location::AbstractString`: The `string` describing the geographical area covered by a post-processing product.
* `call_f::AbstractString`: The name of the highest-level function that requested the use or creation of this directory.
* `prdct::AbstractString`: The name of the main product involved.
* `ftype::AbstractString`: The file type involved.

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

julia> include(JMTools_test * "src/split_post_fpath_tst_3.jl")
split_post_fpath_tst_3

julia> mroot_post, user, project, location, call_f, prdct, ftype = split_post_fpath_tst_3();

julia> @test mroot_post == "/Users/michel/Projects/MISR/Scrap/"
Test Passed

julia> @test user == "Dev"
Test Passed

julia> @test project == "Test"
Test Passed

julia> @test location == "P168+O068050+B110"
Test Passed

julia> @test call_f == "make_post_fpath"
Test Passed

julia> @test prdct == "L1RCCMMVR"
Test Passed

julia> @test ftype == "Map"
Test Passed
```
"""
function split_post_fpath_tst_3(
    )::Tuple{AbstractString, AbstractString, AbstractString, AbstractString, AbstractString, AbstractString, AbstractString}

    mroot_post, user, project, location, call_f, prdct, ftype =
        split_post_fpath("/Users/michel/Projects/MISR/Scrap/U=John/P=Test/P168-P170+O068000-O072000+B110-B112+SITE_SKUKUZA/make_post_fpath/L1RCCMMVR/Map/")

    return mroot_post, user, project, location, call_f, prdct, ftype

end
