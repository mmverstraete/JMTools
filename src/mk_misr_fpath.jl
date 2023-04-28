"""
    misr_fpath = mk_misr_fpath(misr_prdct, misr_path)

# Purpose:
Generate the recommended directory name of the folder containing the MISR data file(s) represented by the acronym `misr_prdct` for the MISR PATH `misr_path`.

# Required positional argument(s):
* `misr_prdct::AbstractString`: The MISR product acronym.
* `misr_path::Integer`: The MISR Path number.

# Optional keyword(s): None.

# Returned value(s):
* `misr_fpath::AbstractString`: The name of the folder containing MISR data file(s) for the specified product and Path number.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* JMtk15 package: Version 0.1.0 (2023-02-15).
* JMTools package: Version 0.1.0 (2023-05-15).
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
1. This function assumes that MISR data file(s) are organized as described in the User Manual.

# Example(s):
```julia
julia> using JMTools

julia> misr_prdct = "L1RTGM"
"L1RTGM"

julia> misr_path = 168
168

julia> misr_fpath = mk_misr_fpath(misr_prdct, misr_path)
"/Volumes/MISR_Data0/P168/L1RTGM/"
```
"""
function mk_misr_fpath(
    misr_prdct::AbstractString,
    misr_path::Integer
    )::AbstractString

    # Check the required input arguments and set the string version of the MISR Path number:
    bool, prdct_name, prdct_ful_name, prdct_esdt = is_valid_misr_prdct(misr_prdct)
    if bool == false
        error("mk_misr_fpath: Invalid MISR product acronym.")
    end
    bool, misr_path_string = is_valid_misr_path(misr_path)
    if bool == false
        error("mk_misr_fpath: Invalid MISR Path number: must be in [1, 233].")
    end
    
    # Set the root volume containing the MISR data file(s):
    misr_fpath = "/Volumes/MISR_Data0/"

    # Set the name of the folder containing the data file(s) for the specified MISR product acronym and Path:
    misr_fpath = misr_fpath * misr_path_string * "/" * misr_prdct * "/"

    return misr_fpath

end
