"""
    outcome = is_valid_misrhr_subprdct_tst_L1RCCMMVRcldm()

# Purpose(s):
* Generate the output of is_valid_misrhr_subprdct.jl` for testing purposes. Test L1RCCMMVRcldm: For the `cldm` subproduct of the MISR-HR L1RCCMMVR product.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misrhr_subprdct` acronym is a valid subproduct of `misrhr_prdct` or not.
* `subprdct_name::AbstractString`: The full name of the MISR-HR subproduct.

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

julia> include(JMTools_test * "src/is_valid_misrhr_subprdct_tst_L1RCCMMVRcldm.jl")
is_valid_misrhr_subprdct_tst_L1RCCMMVRcldm

julia> bool, subprdct_name = is_valid_misrhr_subprdct_tst_L1RCCMMVRcldm()
(true, "Cloud Mask")

julia> @test bool == true
Test Passed

julia> @test subprdct_name == "Cloud Mask"
Test Passed
```
"""
function is_valid_misrhr_subprdct_tst_L1RCCMMVRcldm(
    )::Tuple{Bool, AbstractString}

    bool, subprdct_name = is_valid_misrhr_subprdct("L1RCCMMVR", "cldm")

    return bool, subprdct_name

end
