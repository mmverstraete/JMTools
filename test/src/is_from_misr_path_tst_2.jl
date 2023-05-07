"""
    bool = is_from_misr_path_tst_2()

# Purpose:
Generate the output of `is_from_misr_path.jl` for testing purposes. Test 2: Invalid combination of Path and Orbit.

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

julia> include(JMTools_test * "src/is_from_misr_path_tst_2.jl")
is_from_misr_path_tst_2

julia> bool = is_from_misr_path_tst_2();

julia> @test bool == false
Test Passed
```
"""
function is_from_misr_path_tst_2()
    misr_path = 169
    misr_orbit = 68050
    bool = is_from_misr_path(misr_path, misr_orbit)

    return bool

end
