"""
    bool, prdct_name, prdct_full_name, prdct_esdt = is_valid_misr_prdct(misr_prdct)

# Purpose:
Determine whether the specified `misr_prdct` is a valid MISR product acronym, and return the product label used in filenames, the full MISR product name, and the MISR product Earth Science Data Type (ESDT) useful to acquire data files on the NASA ASDC Data Pool.

# Required positional argument(s):
* `misr_prdct::AbstractString`: The MISR product acronym.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether `misr_prdct` acronym is valid or not.
* `prdct_name::AbstractString`: The product label used in filenames.
* `prdct_full_name::AbstractString`: The full name of the MISR product.
* `prdct_esdt::AbstractString`: The Earth Science Data Type (ESDT) label of the MISR product.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* This function currently recognizes only the MISR product acronyms defined below; additional acronyms can be added as needed.

# Example(s):
```julia
julia> using JMTools

julia> bool, prdct_name, prdct_full_name, prdct_esdt = is_valid_misr_prdct("L1RTGM")
(true, "GRP_TERRAIN_GM", "Terrain Projected Radiance Global Mode Product", "MI1B2E")

julia> bool, prdct_name, prdct_full_name, prdct_esdt = is_valid_misr_prdct("AGP")
(true, "AGP", "Ancillary Geographic Product", "MIANCAGP")

julia> bool, prdct_name, prdct_full_name, prdct_esdt = is_valid_misr_prdct("agp")
(false, "", "", "")
```
"""
function is_valid_misr_prdct(
    misr_prdct::AbstractString
    )::Tuple{Bool, AbstractString, AbstractString, AbstractString}

    if misr_prdct == "AGP"
        bool = true
        prdct_name = "AGP"
        prdct_full_name = "Ancillary Geographic Product"
        prdct_esdt = "MIANCAGP"
    elseif misr_prdct == "L1BROW"
        bool = true
        prdct_name = "GRP_ELLIPSOID_BR_GM"
        prdct_full_name = "Ellipsoid Projected Browse Product"
        prdct_esdt = "MISBR"
    elseif misr_prdct == "L1GMP"
        bool = true
        prdct_name = "GP_GMP"
        prdct_full_name = "Geometric Parameters Product"
        prdct_esdt = "MIB2GEOP"
    elseif misr_prdct == "L1REGM"
        bool = true
        prdct_name = "GRP_ELLIPSOID_GM"
        prdct_full_name = "Ellipsoid Projected Radiance Global Mode Product"
        prdct_esdt = "MI1B2E"
    elseif misr_prdct == "L1RELM"
        bool = true
        prdct_name = "GRP_ELLIPSOID_LM"
        prdct_full_name = "Ellipsoid Projected Radiance Local Mode Product"
        prdct_esdt = "MB2LME"
    elseif misr_prdct == "L1RTGM"
        bool = true
        prdct_name = "GRP_TERRAIN_GM"
        prdct_full_name = "Terrain Projected Radiance Global Mode Product"
        prdct_esdt = "MI1B2E"
    elseif misr_prdct == "L1RTLM"
        bool = true
        prdct_name = "GRP_TERRAIN_LM"
        prdct_full_name = "Terrain Projected Radiance Local Mode Product"
        prdct_esdt = "MB2LMT"
    elseif misr_prdct == "L1RCCM"
        bool = true
        prdct_name = "GRP_RCCM_GM"
        prdct_full_name = "Radiometric Camera-by-Camera Cloud Mask Product"
        prdct_esdt = "MIRCCM"
    elseif misr_prdct == "L2TALBEDO"
        bool = true
        prdct_name = "TC_ALBEDO"
        prdct_full_name = "TOA Cloud Albedo Product"
        prdct_esdt = "MIL2TCAL"
    elseif misr_prdct == "L2TCLASS"
        bool = true
        prdct_name = "TC_CLASSIFIERS"
        prdct_full_name = "TOA Cloud Classifier Product"
        prdct_esdt = "MIL2TCCL"
    elseif misr_prdct == "L2TSTEREO"
        bool = true
        prdct_name = "TC_STEREO"
        prdct_full_name = "TOA Cloud Stereo Product"
        prdct_esdt = "MIL2TCST"
    elseif misr_prdct == "L2TCCLOUD"
        bool = true
        prdct_name = "TC_CLOUD"
        prdct_full_name = "Cloud Heights and Motion Product"
        prdct_esdt = "MIL2TCSP"
    elseif misr_prdct == "L2AERO"
        bool = true
        prdct_name = "AS_AEROSOL"
        prdct_full_name = "Aerosol Product"
        prdct_esdt = "MIL2ASAE"
    elseif misr_prdct == "L2LAND"
        bool = true
        prdct_name = "AS_LAND"
        prdct_full_name = "Land Surface Product"
        prdct_esdt = "MIL2ASLS"
    else
        bool = false
        prdct_name = ""
        prdct_full_name = ""
        prdct_esdt = ""
    end

    return bool, prdct_name, prdct_full_name, prdct_esdt

end
