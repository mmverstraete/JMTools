"""
    matrix_lr = hr2lr_tst_2()

# Purpose(s):
Generate the output of `hr2lr.jl` for testing purposes. Test 2: For a LWCMask array.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `matrix_lr::AbstractMatrix{Real}`: A shrunk numeric array of the same type as `matrix_hr`, where each dimension is `factor` times smaller than the same dimension of `matrix_hr`.

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

julia> include(JMTools_test * "src/hr2lr_tst_2.jl")
hr2lr_tst_2

julia> matrix_lr = hr2lr_tst_2();

julia> @test matrix_lr == [
        0x01  0x02  0x03
        0x02  0x01  0x03
        0x03  0xfe  0x02
        0xfe  0xfe  0x01]
Test Passed
```
"""
function hr2lr_tst_2(
    )::AbstractMatrix{<:Real}

    matrix_hr = [
        0x01    0x01    0x02    0x02    0x03    0x03
        0x01    0x01    0x02    0x02    0x03    0x03
        0x01    0x02    0x01    0x01    0x02    0x01
        0x02    0x01    0x01    0x03    0x03    0x03
        0x01    0x02    0xfe    0xfd    0x02    0xfe
        0x03    0xfd    0xfe    0xfd    0x02    0x03
        0x03    0x03    0x01    0xfe    0x01    0x01
        0xfe    0xfe    0xfe    0xfd    0x03    0xfd]

        matrix_lr = hr2lr(matrix_hr, 2, "LWCMask")

    return matrix_lr

end
