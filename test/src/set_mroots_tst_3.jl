"""
    mroots = set_mroots_tst_3()

# Purpose(s):
Generate the output of `set_mroots.jl` for testing purposes. Test 3: Unset the environmental variables.

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

julia> include(JMTools_test * "src/set_mroots_tst_3.jl")
set_mroots_tst_3

julia> mroots = set_mroots_tst_3();

julia> @test mroots[1] == "ENV[\"MROOT_MISR\"] is not set."
Test Passed

julia> @test mroots[2] == "ENV[\"MROOT_MISRHR\"] is not set."
Test Passed

julia> @test mroots[3] == "ENV[\"MROOT_POST\"] is not set."
Test Passed

julia> @test mroots[4] == "ENV[\"MROOT_AGP\"] is not set."
Test Passed

julia> @test mroots[5] == "ENV[\"MROOT_SCRAP\"] is not set."
Test Passed
```
"""
function set_mroots_tst_3(
    )::Tuple{AbstractString, AbstractString, AbstractString, AbstractString, AbstractString}

    mroots = set_mroots("Unset")

    return mroots

end
