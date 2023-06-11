"""
    matrix_lr = hr2lr_tst_1()

# Purpose(s):
Generate the output of `hr2lr.jl` for testing purposes. Test 1: For a Brf array.

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

julia> include(JMTools_test * "src/hr2lr_tst_1.jl")
hr2lr_tst_1

julia> matrix_lr = hr2lr_tst_1();

julia> @test matrix_lr == [
        0.12  0.14
        0.16  0.18
        0.25  0.0]
Test Passed
```
"""
function hr2lr_tst_1(
    )::AbstractMatrix{<:Real}

    matrix_hr = [
        0.12 0.12 0.14 9.99;
        0.12 0.12 0.14 0.14;
        0.16 0.16 9.99 9.99;
        9.99 9.99 9.99 0.18;
        0.21 0.23 9.99 9.99;
        0.27 0.29 9.99 9.99]

    matrix_lr = hr2lr(matrix_hr, 2, "Brf")

    return matrix_lr

end
