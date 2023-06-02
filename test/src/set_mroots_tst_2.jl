"""
    mroots = set_mroots_tst_2()

# Purpose(s):
* Generate the output of `set_mroots.jl` for testing purposes. Test 2: Update some of the environmental variables, after running `set_mroots_tst_1.jl`.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `mroots::Tuple{AbstractString, AbstractString, AbstractString, AbstractString, AbstractString}`: The set of 5 environmental variables (if set) or messages (if unset).

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

julia> include(JMTools_test * "src/set_mroots_tst_2.jl")
set_mroots_tst_2

julia> mroots = set_mroots_tst_2();

julia> @test mroots[1] == "/dir/misr"
Test Passed

julia> @test mroots[2] == "/dir/misrhr/newdir"
Test Passed

julia> @test mroots[3] == "/dir/post/nextcase"
Test Passed

julia> @test mroots[4] == "/dir/agp"
Test Passed

julia> @test mroots[5] == "/dir/scrap"
Test Passed
```
"""
function set_mroots_tst_2(
    )::Tuple{AbstractString, AbstractString, AbstractString, AbstractString, AbstractString}

    mroots = set_mroots("Set"; mroot_misr = "/dir/misr", mroot_misrhr = "/dir/misrhr", mroot_post = "/dir/post", mroot_agp = "/dir/agp", mroot_scrap = "/dir/scrap")
    mroots = set_mroots("Set"; mroot_misr = "/dir/misr", mroot_misrhr = "/dir/misrhr/newdir", mroot_post = "/dir/post/nextcase", mroot_agp = "/dir/agp", mroot_scrap = "/dir/scrap")

    return mroots

end
