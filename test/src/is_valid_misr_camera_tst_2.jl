"""
    bool = is_valid_misr_camera_tst_2()

# Purpose:
Generate the output of `is_valid_misr_camera.jl` for testing purposes. Test 2: For the MISR camera specification "*" (all 9 cameras).

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

julia> include(JMTools_test * "src/is_valid_misr_camera_tst_2.jl")
is_valid_misr_camera_tst_2

julia> bool = is_valid_misr_camera_tst_2();

julia> @test bool == true
Test Passed
```
"""
function is_valid_misr_camera_tst_2()
    misr_camera = "*"
    bool = is_valid_misr_camera(misr_camera)
    return bool
end
