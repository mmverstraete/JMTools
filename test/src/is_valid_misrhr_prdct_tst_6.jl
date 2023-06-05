"""
    bool = is_valid_misrhr_prdct_tst_6()

# Purpose(s):
* Generate the output of `is_valid_misrhr_prdct.jl` for testing purposes. Test 6: For the MISR-HR TIP product.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misrhr_prdct` is valid or not.
* `prdct_full_name::AbstractString`: The full name of the MISR-HR product.

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

julia> include(JMTools_test * "src/is_valid_misrhr_prdct_tst_6.jl")
is_valid_misrhr_prdct_tst_6

julia> bool, prdct_full_name = is_valid_misrhr_prdct_tst_6();

julia> @test bool == true
Test Passed

julia> @test prdct_full_name == "Two-stream Inversion Package"
Test Passed
```
"""
function is_valid_misrhr_prdct_tst_6()

    misrhr_prdct = "TIP"
    bool, prdct_full_name = is_valid_misrhr_prdct(misrhr_prdct)

    return bool, prdct_full_name

end
