"""
    matrix_lr = hr2lr_tst_3()

# Purpose(s):
Generate the output of `hr2lr.jl` for testing purposes. Test 3: For a Rad array.

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

julia> include(JMTools_test * "src/hr2lr_tst_3.jl")
hr2lr_tst_3

julia> matrix_lr = hr2lr_tst_3();

julia> @test matrix_lr == [
        350.0  400.0  450.0
        340.0  330.0  310.0]
Test Passed
```
"""
function hr2lr_tst_3(
    )::AbstractMatrix{<:Real}

    matrix_hr = [
        350.0   350.0   400.0   400.0   450.0   450.0
        350.0   350.0   400.0   400.0   450.0   450.0
        320.0   340.0   320.0   340.0   310.0   0.0
        360.0   0.0     0.0     0.0     0.0     0.0]

        matrix_lr = hr2lr(matrix_hr, 2, "Rad")

    return matrix_lr

end
