"""
    misr_fpath = mk_misr_fpath(misr_prdct, misr_path)

# Purpose:
Generate the default name of the folder containing the MISR data file(s) for `misr_prdct` along the MISR PATH `misr_path`.

# Required positional argument(s):
* `misr_path::Integer`: The MISR Path number.
* `misr_prdct::AbstractString`: The MISR product acronym.

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
* This function assumes that MISR data file(s) are organized as described in the User Manual.
* The default directory name assumes the existence of the environmental variable `MROOT_MISR`, which can be permanently set in the configuration file `.zshenv` or temporarily set by function `set_mroots.jl`.
* This default directory name is recommended but can be overridden by providing an alternate directory when calling function `mk_misr_fspec.jl`.

# Example(s):
```julia
julia> using JMTools

julia> set_mroots("Reset")

julia> misr_path = 168
168

julia> misr_prdct = "L1RTGM"
"L1RTGM"

julia> misr_fpath = mk_misr_fpath(misr_prdct, misr_path)
"/Volumes/MISR_Data0/P168/L1RTGM/"
```
"""
function mk_misr_fpath(
    misr_prdct::AbstractString,
    misr_path::Integer
    )::AbstractString

    # Check the positional arguments and set the string version of the MISR Path number:
    bool, misr_path_string = is_valid_misr_path(misr_path)
    if bool == false
        error("mk_misr_fpath: Invalid MISR Path number: must be in [1, 233].")
    end
    bool, prdct_name, prdct_ful_name, prdct_esdt = is_valid_misr_prdct(misr_prdct)
    if bool == false
        error("mk_misr_fpath: Invalid MISR product acronym.")
    end
    
    # Initialize the output variable `misr_fpath` (1) with the value of the environment variable `MROOT_AGP`, if the argument `misr_prdct` is "AGP" and if that environment variable exists and is not a null string, (2) with the value of the environment variable `MROOT_MISR`, if it exists and is not a null string, and (3) with the user's home directory otherwise:
    if misr_prdct == "AGP"
        if "MROOT_AGP" in keys(ENV)
            if ENV["MROOT_AGP"] != ""
                misr_fpath = ENV["MROOT_AGP"]
            else
                if "MROOT_MISR" in keys(ENV)
                    if ENV["MROOT_MISR"] != ""
                        misr_fpath = ENV["MROOT_MISR"]
                    else
                        misr_fpath = "~"
                    end
                else
                    misr_fpath = "~"
                end
            end
        else
            if ENV["MROOT_MISR"] != ""
                misr_fpath = ENV["MROOT_MISR"]
            else
                misr_fpath = "~"
            end
        end
    else
        if ENV["MROOT_MISR"] != ""
            misr_fpath = ENV["MROOT_MISR"]
        else
            misr_fpath = "~"
        end
    end

    if misr_fpath[lastindex(misr_fpath)] != '/'
        misr_fpath = misr_fpath * '/'
    end

    # Add the name of the folders containing the data file(s) for the specified MISR Path and product acronym:
    misr_fpath = misr_fpath * misr_path_string * "/" * misr_prdct * "/"

    return misr_fpath

end
