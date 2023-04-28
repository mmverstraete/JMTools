"""
    bool, misr_orbit_string = is_valid_misr_orbit_tst_068050()

# Purpose:
Generate the output of `is_valid_misr_orbit.jl` for testing purposes. Test 068050: For the MISR Orbit number 68050.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Example:
```julia
julia> using JMTools

julia> using Test

julia> include(JMTools_test * "src/is_valid_misr_orbit_tst_068050.jl")
is_valid_misr_orbit_tst_068050

julia> bool, misr_orbit_string = is_valid_misr_orbit_tst_068050();

julia> @test bool == true
Test Passed

julia> @test misr_orbit_string == "O068050"
Test Passed
```
"""
function is_valid_misr_orbit_tst_068050()
    misr_orbit = 68050
    bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
    return bool, misr_orbit_string
end
