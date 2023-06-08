"""
    matrix_hr = lr2hr_tst_1()

# Purpose(s):
* Generate the output of `lr2hr.jl` for testing purposes. Test 1: String matrix.

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

julia> include(JMTools_test * "src/lr2hr_tst_1.jl")
lr2hr_tst_1

julia> matrix_hr = lr2hr_tst_1();

julia> @test matrix_hr == [
       "white"   "white"   "white"   "black"   "black"   "black"
       "white"   "white"   "white"   "black"   "black"   "black"
       "white"   "white"   "white"   "black"   "black"   "black"
       "yellow"  "yellow"  "yellow"  "orange"  "orange"  "orange"
       "yellow"  "yellow"  "yellow"  "orange"  "orange"  "orange"
       "yellow"  "yellow"  "yellow"  "orange"  "orange"  "orange"
       "blue"    "blue"    "blue"    "green"   "green"   "green"
       "blue"    "blue"    "blue"    "green"   "green"   "green"
       "blue"    "blue"    "blue"    "green"   "green"   "green"]
Test Passed
```
"""
function lr2hr_tst_1(
    )::AbstractMatrix

    matrix_lr = ["white" "black"; "yellow" "orange"; "blue" "green"]
    matrix_hr = lr2hr(matrix_lr, 3)

    return matrix_hr

end
