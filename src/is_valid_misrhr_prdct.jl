"""
    bool, prdct_full_name = is_valid_misrhr_prdct(misrhr_prdct)

# Purpose(s):
* Determine whether the specified `misrhr_prdct` is a valid MISR-HR product acronym.

# Positional argument(s):
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misrhr_prdct` is valid or not.
* `prdct_full_name::AbstractString`: The full name of the MISR-HR product.

# Algorithm:
* This function verifies that the positional argument `misrhr_prdct` is a valid MISR-HR product acronym and returns the full product name.

# Reference(s):
* The MISR-HR Processing System Manual.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s): None.

# Example 1:
```julia
julia> using JMTools

julia> bool, prdct_full_name = is_valid_misrhr_prdct("L1RCCMMVR")
(true, "Radiometric Camera-by-Camera Cloud Mask, Missing Values Replaced")
```

# Example 2:
```julia
julia> using JMTools

julia> bool, prdct_full_name = is_valid_misrhr_prdct("TIP")
(true, "Two-stream Inversion Package")
```

# Example 3:
```julia
julia> using JMTools

julia> bool, prdct_full_name = is_valid_misrhr_prdct("l1B3")
(false, "")
```
"""
function is_valid_misrhr_prdct(
    misrhr_prdct::AbstractString
    )::Tuple{Bool, AbstractString}

    if misrhr_prdct == "L1RCCMMVR"
        bool = true
        prdct_full_name = "Radiometric Camera-by-Camera Cloud Mask, Missing Values Replaced"

    elseif misrhr_prdct == "L1RTGMMVR"
        bool = true
        prdct_full_name = "Terrain Projected Radiance Global Mode Product, Missing Values Replaced"

    elseif misrhr_prdct == "L1B3"
        bool = true
        prdct_full_name = "Terrain Projected Radiance Global Mode Product at Native Spatial Resolution"

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
