"""
    misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location_tst_2()

# Purpose(s):
* Generate the output of `split_location.jl` for testing purposes. Test 1: `location == "P168+O068050+B110"`.

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

julia> include(JMTools_test * "src/split_location_tst_2.jl")
split_location_tst_2

julia> misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location_tst_2();

julia> @test (misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site) == (168, 0, 68050, 0, 110, 0, "")
Test Passed
```
"""
function split_location_tst_2(
    )::Tuple{Integer, Integer, Integer, Integer, Integer, Integer, AbstractString}

    location = "P168+O068050+B110"

    misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location(location)

    return misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site

end
