"""
    post_fpath = make_post_fpath_tst_NoArgs()

# Purpose(s):
* Generate the output of `make_post_fpath.jl` for testing purposes. Test NoArgs: When the environment variables are not set and no arguments are provided.

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

julia> include(JMTools_test * "src/make_post_fpath_tst_NoArgs.jl")
make_post_fpath_tst_NoArgs

julia> post_fpath = make_post_fpath_tst_NoArgs();

julia> @test post_fpath == "~/U=Dev/P=Test/NOLOC/make_post_fpath/all_prdcts/all_ftypes/"
Test Passed
```
"""
function make_post_fpath_tst_NoArgs(
    )::AbstractString

    set_mroots("Unset")
    post_fpath = make_post_fpath()

    return post_fpath

end
