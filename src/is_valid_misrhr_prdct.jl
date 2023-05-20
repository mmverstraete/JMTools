"""
    bool, prdct_full_name = is_valid_misrhr_prdct(misrhr_prdct)

# Purpose:
Determine whether the specified `misrhr_prdct` is a valid MISR-HR product acronym.

# Required positional argument(s):
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether `misrhr_prdct` is valid or not.

# Algorithm:
* This function verifies that the positional argument `misrhr_prdct` is a valid MISR-HR product acronym and returns the full product name.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* This function does not return a `prdct_name` label (as is done with `is_valid_misr_prdct`) because
- MISR-HR L1B3 products share the same filenames as the original L1B2 product filenames from which they are derived, and append the label `_MISRHR_[Version]` at its end, before the file extension.
- The other MISR-HR product filenames start with the label `MISR_HR_` followed by the product acronym (`BRF`, `RPV`, or `TIP`).

# Example(s):
```julia
julia> using JMTools

julia> bool, prdct_full_name = is_valid_misrhr_prdct("TIP")
(true, "Two-stream Inversion Package")

julia> bool, prdct_full_name = is_valid_misrhr_prdct("l1B3")
(false, "")
```
"""
function is_valid_misrhr_prdct(
    misrhr_prdct::AbstractString
    )::Tuple{Bool, AbstractString}

    if misrhr_prdct == "L1B3"
        bool = true
        prdct_full_name = "Terrain Projected Radiance Global Mode Product at Native Resolution"

    elseif misrhr_prdct == "BRF"
        bool = true
        prdct_full_name = "Bidirectional Reflectance Factor at Native Resolution"

    elseif misrhr_prdct == "RPV"
        bool = true
        prdct_full_name = "Rahman-Pinty-Verstraete Model Parameters"

    elseif misrhr_prdct == "TIP"
        bool = true
        prdct_full_name = "Two-stream Inversion Package"

    else
        bool = false
        prdct_full_name = ""
    end

    return bool, prdct_full_name

end
