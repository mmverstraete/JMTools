"""
    prdct_version = set_current_prdct_version(prdct)

# Purpose(s):
* Return the current (default) version label of the specified MISR, MISR-HR or post-processing product acronym.

# Positional argument(s):
* `prdct::AbstractString`: The MISR, MISR-HR or post-processing product acronym name.

# Keyword argument(s): None.

# Return value(s):
* `prdct_version::AbstractString`: The current version label of the specified MISR, MISR-HR or post-processing product acronym.

# Algorithm:
* This function reports the current version label of the specified MISR, MISR-HR or post-processing product acronym.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* The version labels provided below need to be updated
- when new MISR products are generated or existing products are updated at NASA ASDC,
- when new MISR-HR products are generated or existing products are updated, or
- when new versions of the post-processing functions are generated.

# Example 1:
```julia
julia> using JMTools

julia> prdct_version = set_current_prdct_version("L1RTGM")
"F03_0024"
```

# Example 2:
```julia
julia> using JMTools

julia> prdct_version = set_current_prdct_version("RPV")
"v3.0.0"
```

# Example 3:
```julia
julia> using JMTools

julia> prdct_version = set_current_prdct_version("ABcd")
ERROR: set_current_prdct_version: prdct = ABcd not implemented yet.
```
"""
function set_current_prdct_version(
    prdct::AbstractString
    )::AbstractString

    if prdct == "AGP"
        prdct_version = "F01_24"
    elseif prdct == "L1BROW"
        prdct_version = "F03_0024"
    elseif prdct == "L1GMP"
        prdct_version = "F03_0013"
    elseif prdct == "L1REGM"
        prdct_version = "F03_0024"
    elseif prdct == "L1RELM"
        prdct_version = "F03_0024"
    elseif prdct == "L1RTGM"
        prdct_version = "F03_0024"
    elseif prdct == "L1RTLM"
        prdct_version = "F03_0024"
    elseif prdct == "L1RCCM"
        prdct_version = "F04_0025"
    elseif prdct == "L2CLAL"
        prdct_version = "F05_0011"
    elseif prdct == "L2CLCL"
        prdct_version = "F07_0012"
    elseif prdct == "L2CLST"
        prdct_version = "F08_0017"
    elseif prdct == "L2CLOU"
        prdct_version = "F01_0001"
    elseif prdct == "L2AERO"
        prdct_version = "F13_0023"
    elseif prdct == "L2LAND"
        prdct_version = "F08_0023"

    elseif prdct == "L1RTGMMVR"
        prdct_version = "v3.0.0"
    elseif prdct == "L1RCCMMVR"
        prdct_version = "v3.0.0"
    elseif prdct == "L1B3"
        prdct_version = "v3.0.0"
    elseif prdct == "BRF"
        prdct_version = "v3.0.0"
    elseif prdct == "RPV"
        prdct_version = "v3.0.0"
    elseif prdct == "TIP"
        prdct_version = "v3.0.0"

    else
        error("set_current_prdct_version: prdct = " * string(prdct) *
            " not implemented yet.")
    end

    return prdct_version
end
