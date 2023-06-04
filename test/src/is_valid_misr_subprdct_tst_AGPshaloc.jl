"""
    bool, subprdct_name = is_valid_misr_subprdct_tst_AGPshaloc()

# Purpose(s):
* Generate the output of `is_valid_misr_subprdct.jl` for testing purposes. Test AGPshaloc: For the `shaloc` subproduct of the MISR AGP product.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misr_subprdct` acronym is a valid subproduct of `misr_prdct` or not.

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

julia> include(JMTools_test * "src/is_valid_misr_subprdct_tst_AGPshaloc.jl")
is_valid_misr_subprdct_tst_AGPshaloc

julia> bool, subprdct_name = is_valid_misr_subprdct_tst_AGPshaloc()
(true, "Shallow Ocean")

julia> @test bool == true
Test Passed

julia> @test subprdct_name == "Shallow Ocean"
Test Passed
```
"""
function is_valid_misr_subprdct_tst_AGPshaloc(
    )::Tuple{Bool, AbstractString}

    bool, subprdct_name = is_valid_misr_subprdct("AGP", "shaloc")

    return bool, subprdct_name

end
