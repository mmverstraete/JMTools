"""
    misr_prdct_version = current_misr_prdct_version(misr_prdct)

# Purpose:
Return the current version label for the specified MISR product acronym.

# Required positional argument(s):
* `misr_prdct::AbstractString`: The MISR product acronym name.

# Optional keyword(s): N/A.

# Returned value(s):
* `misr_prdct_version::AbstractString`: The current version label for the specified MISR product acronym.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* The version identifiers defined below may need to be updated when new products are generated at NASA ASDC.

# Example(s):
```julia
julia> using JMTools

julia> misr_prdct_version = current_misr_prdct_version("L2AERO")
"F13_0023"

julia> misr_prdct_version = current_misr_prdct_version("ABcd")
ERROR: current_misr_prdct_version: Unrecognized MISR product.
```
"""
function current_misr_prdct_version(
    misr_prdct::AbstractString
    )::AbstractString

    if misr_prdct == "AGP"
        misr_prdct_version = "F01_24"
    elseif misr_prdct == "L1BROW"
        misr_prdct_version = "F03_0024"
    elseif misr_prdct == "L1GMP"
        misr_prdct_version = "F03_0013"
    elseif misr_prdct == "L1REGM"
        misr_prdct_version = "F03_0024"
    elseif misr_prdct == "L1RELM"
        misr_prdct_version = "F03_0024"
    elseif misr_prdct == "L1RTGM"
        misr_prdct_version = "F03_0024"
    elseif misr_prdct == "L1RTLM"
        misr_prdct_version = "F03_0024"
    elseif misr_prdct == "L1RCCM"
        misr_prdct_version = "F04_0025"
    elseif misr_prdct == "L2CLAL"
        misr_prdct_version = "F05_0011"
    elseif misr_prdct == "L2CLCL"
        misr_prdct_version = "F07_0012"
    elseif misr_prdct == "L2CLST"
        misr_prdct_version = "F08_0017"
    elseif misr_prdct == "L2CLOU"
        misr_prdct_version = "F01_0001"
    elseif misr_prdct == "L2AERO"
        misr_prdct_version = "F13_0023"
    elseif misr_prdct == "L2LAND"
        misr_prdct_version = "F08_0023"
    else
        error("current_misr_prdct_version: Unrecognized MISR product.")
    end

    return misr_prdct_version
end
