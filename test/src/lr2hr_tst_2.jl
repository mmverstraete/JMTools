"""
    matrix_hr = lr2hr_tst_2()

# Purpose(s):
* Generate the output of `lr2hr.jl` for testing purposes. Test 2: Integer matrix.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `matrix_hr::AbstractMatrix`: A matrix `factor` times larger than `matrix_lr` in each dimension, where the elements have been duplicated.

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

julia> include(JMTools_test * "src/lr2hr_tst_2.jl")
lr2hr_tst_2

julia> matrix_hr = lr2hr_tst_2();
 
julia> @test matrix_hr == [
        1  1  2  2
        1  1  2  2
        3  3  4  4
        3  3  4  4]
Test Passed
```
"""
function lr2hr_tst_2(
    )::AbstractMatrix

    matrix_lr = [1 2; 3 4]
    matrix_hr = lr2hr(matrix_lr, 2)

    return matrix_hr

end
