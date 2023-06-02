"""
    misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location_tst_1()

# Purpose(s):
* Generate the output of `split_location.jl` for testing purposes. Test 1: `location == "NOLOC"`.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misr_path1::Integer`: The first (or only) MISR Path number.
* `misr_path2::Integer`: The last MISR Path number.
* `misr_orbit1::Integer`: The first (or only) MISR Orbit number.
* `misr_orbit2::Integer`: The last MISR Orbit number.
* `misr_block1::Integer`: The first (or only) MISR Block number.
* `misr_block2::Integer`: The last MISR Block number.
* `misr_site::AbstractString`: The MISR Local Mode Site name.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-02-15).

# Example 1:
```julia
julia> using JMTools

julia> using Test

julia> include(JMTools_test * "src/split_location_tst_1.jl")
split_location_tst_1

julia> misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location_tst_1();

julia> @test (misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site) == (0, 0, 0, 0, 0, 0, "")
Test Passed
```
"""
function split_location_tst_1(
    )::Tuple{Integer, Integer, Integer, Integer, Integer, Integer, AbstractString}

    location = "NOLOC"

    misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location(location)

    return misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site

end
