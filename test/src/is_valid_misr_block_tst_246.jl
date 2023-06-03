"""
    bool, misr_block_string = is_valid_misr_block_tst_246()

# Purpose(s):
* Generate the output of `is_valid_misr_block.jl` for testing purposes. Test 246: For a MISR Block number 246.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misr_block` is a valid MISR Block number or not.
* `misr_block_string::AbstractString`: The string version of the MISR Block number, prepended with the letter `'B'`.

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

julia> include(JMTools_test * "src/is_valid_misr_block_tst_246.jl")
is_valid_misr_block_tst_246

julia> bool, misr_block_string = is_valid_misr_block_tst_246();

julia> @test bool == false
Test Passed

julia> @test misr_block_string == ""
Test Passed
```
"""
function is_valid_misr_block_tst_246()
    misr_block = 246
    bool, misr_block_string = is_valid_misr_block(misr_block)
    return bool, misr_block_string
end
