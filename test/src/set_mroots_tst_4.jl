"""
    mroots = set_mroots_tst_4()

# Purpose(s):
Generate the output of `set_mroots.jl` for testing purposes. Test 4: Reset the environmental variables to their default values.

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

julia> include(JMTools_test * "src/set_mroots_tst_4.jl")
set_mroots_tst_4

julia> mroots = set_mroots_tst_4();

julia> @test mroots[1] == "/Volumes/MISR_Data0/"
Test Passed

julia> @test mroots[2] == "/Volumes/MISR-HR/"
Test Passed

julia> @test mroots[3] == "/Volumes/Output/Post/"
Test Passed

julia> @test mroots[4] == "/Users/michel/Projects/MISR/Data/AGP/"
Test Passed

julia> @test mroots[5] == "/Users/michel/Projects/MISR/Scrap/"
Test Passed
```
"""
function set_mroots_tst_4(
    )::Tuple{AbstractString, AbstractString, AbstractString, AbstractString, AbstractString}

    mroots = set_mroots("Reset")

    return mroots

end
