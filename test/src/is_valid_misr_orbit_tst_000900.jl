"""
    bool, misr_orbit_string = is_valid_misr_orbit_tst_000900()

# Purpose(s):
* Generate the output of `is_valid_misr_orbit.jl` for testing purposes. Test 000900: For the MISR Orbit number 900.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misr_orbit` is a valid MISR Orbit number or not.
* `misr_orbit_string::AbstractString`: The string version of the MISR Orbit number, prepended with the letter `'O'`.

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

julia> include(JMTools_test * "src/is_valid_misr_orbit_tst_000900.jl")
is_valid_misr_orbit_tst_000900

julia> bool, misr_orbit_string = is_valid_misr_orbit_tst_000900();

julia> @test bool == false
Test Passed

julia> @test misr_orbit_string == ""
Test Passed
```
"""
function is_valid_misr_orbit_tst_000900()
    misr_orbit = 900
    bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
    return bool, misr_orbit_string
end
