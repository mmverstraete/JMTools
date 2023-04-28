"""
    bool, misr_block_string = is_valid_misr_block_tst_168()

# Purpose:
Generate the output of `is_valid_misr_block.jl` for testing purposes. Test 168: For a MISR Block number 168.

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

julia> include(JMTools_test * "src/is_valid_misr_block_tst_168.jl")
is_valid_misr_block_tst_168

julia> bool, misr_block_string = is_valid_misr_block_tst_168();

julia> @test bool == true
Test Passed

julia> @test misr_block_string == "B168"
Test Passed
```
"""
function is_valid_misr_block_tst_168()
    misr_block = 168
    bool, misr_block_string = is_valid_misr_block(misr_block)
    return bool, misr_block_string
end
