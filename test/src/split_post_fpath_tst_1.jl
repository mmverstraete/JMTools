"""
    mroot_post, user, project, location, call_f, prdct, ftype = split_post_fpath_tst_1()

# Purpose(s):
Generate the output of `split_post_fpath.jl` for testing purposes. Test 1: For a generic path.

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

julia> include(JMTools_test * "src/split_post_fpath_tst_1.jl")
split_post_fpath_tst_1

julia> mroot_post, user, project, location, call_f, prdct, ftype = split_post_fpath_tst_1();

julia> @test mroot_post == "~/"
Test Passed

julia> @test user == "Dev"
Test Passed

julia> @test project == "Test"
Test Passed

julia> @test location == "NOLOC"
Test Passed

julia> @test call_f == "make_post_fpath"
Test Passed

julia> @test prdct == "all_prdcts"
Test Passed

julia> @test ftype == "all_ftypes"
Test Passed
```
"""
function split_post_fpath_tst_1(
    )::Tuple{AbstractString, AbstractString, AbstractString, AbstractString, AbstractString, AbstractString, AbstractString}

    mroot_post, user, project, location, call_f, prdct, ftype =
           split_post_fpath("~/U=Dev/P=Test/NOLOC/make_post_fpath/all_prdcts/all_ftypes/")

    return mroot_post, user, project, location, call_f, prdct, ftype

end
