"""
    bool = is_valid_misrhr_prdct_tst_1()

# Purpose:
Generate the output of `is_valid_misrhr_prdct.jl` for testing purposes. Test 1: For the MISR-HR L1B3 product.

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

julia> include(JMTools_test * "src/is_valid_misrhr_prdct_tst_1.jl")
is_valid_misrhr_prdct_tst_1

julia> bool = is_valid_misrhr_prdct_tst_1();

julia> @test bool == true
Test Passed
```
"""
function is_valid_misrhr_prdct_tst_1()
    misrhr_prdct = "L1B3"
    bool = is_valid_misrhr_prdct(misrhr_prdct)
    return bool
end
