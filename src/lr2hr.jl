"""
    matrix_hr = lr2hr(matrix_lr, factor)

# Purpose(s):
Upsize the positional argument `matrix_lr` by the expansion `factor` in each dimension, and return an enlarged `matrix_hr` of the same type as `matrix_lr`. The two dimensions of `matrix_hr` are thus multiples of `factor`. The values of the elements in `matrix_hr` are generated by simple duplication and do not depend on the type of `matrix_lr`.

# Positional argument(s):
* `matrix_lr::AbstractMatrix`: The 2-D array to be upsized.
* `factor::Unsigned`: The expansion factor.

# Keyword argument(s): None.

# Return value(s):
* `matrix_hr::AbstractMatrix`: A matrix `factor` times larger than `matrix_lr` in each dimension, where the elements have been duplicated.

# Algorithm:
This function duplicates the value of each element in `matrix_lr` `factor` times in each dimension to generate a pseudo high-resolution output `matrix_hr` of the same type.

# References:
* The MISR-HR Processing System Manual.
* Michel M. Verstraete, Linda A. Hunt, Hugo De Lemos and Larry Di Girolamo (2020) Replacing Missing Values in the Standard MISR Radiometric Camera-by-Camera Cloud Mask (RCCM) Data Product, _Earth System Science Data_, Vol. 12, p. 611-628, available from https://www.earth-syst-sci-data.net/12/611/2020/essd-12-611-2020.html, (DOI: 10.5194/essd-12-611-2020).

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* This function is specifically designed to handle MISR L1B2 files, but is otherwise generic and can be used in other contexts.
* Since this function only duplicates values, it does not change the information content of the original matrix. Contrast this with the function `hr2lr.jl`, which appears to implement the reverse transformation, but loses some information in the process.
* For the record, the MISR-HR processing system does NOT rely on this function to generate the L1B3 product. Instead, this function is used exclusively to facilitate comparisons with high spatial resolution data fields, or to generate maps of Global Mode MISR data of the same size and visual appearance as those created from Local Mode data or MISR-HR products.

# Example 1:
```julia
julia> using JMTools

julia> matrix_lr = ["white" "black"; "yellow" "orange"; "blue" "green"]
3×2 Matrix{String}:
 "white"   "black"
 "yellow"  "orange"
 "blue"    "green"

julia> matrix_hr = lr2hr(matrix_lr, 3)
9×6 Matrix{String}:
 "white"   "white"   "white"   "black"   "black"   "black"
 "white"   "white"   "white"   "black"   "black"   "black"
 "white"   "white"   "white"   "black"   "black"   "black"
 "yellow"  "yellow"  "yellow"  "orange"  "orange"  "orange"
 "yellow"  "yellow"  "yellow"  "orange"  "orange"  "orange"
 "yellow"  "yellow"  "yellow"  "orange"  "orange"  "orange"
 "blue"    "blue"    "blue"    "green"   "green"   "green"
 "blue"    "blue"    "blue"    "green"   "green"   "green"
 "blue"    "blue"    "blue"    "green"   "green"   "green"
```

# Example 2:
```julia
julia> using JMTools

julia> matrix_lr = [1 2; 3 4]
2×2 Matrix{Int64}:
 1  2
 3  4

julia> matrix_hr = lr2hr(matrix_lr, 2)
4×4 Matrix{Int64}:
 1  1  2  2
 1  1  2  2
 3  3  4  4
 3  3  4  4
```

# Example 3:
```julia
julia> matrix_lr = [1.1 2.2 3.3 4.4; 5.5 6.6 7.7 8.8]
2×4 Matrix{Float64}:
 1.1  2.2  3.3  4.4
 5.5  6.6  7.7  8.8

julia> matrix_hr = lr2hr(matrix_lr, 2)
4×8 Matrix{Float64}:
 1.1  1.1  2.2  2.2  3.3  3.3  4.4  4.4
 1.1  1.1  2.2  2.2  3.3  3.3  4.4  4.4
 5.5  5.5  6.6  6.6  7.7  7.7  8.8  8.8
 5.5  5.5  6.6  6.6  7.7  7.7  8.8  8.8
```
"""
function lr2hr(
    matrix_lr::AbstractMatrix,
    factor::Integer
    )::AbstractMatrix

    matrix_hr = repeat(matrix_lr, inner = (factor, factor))

    return matrix_hr

end
