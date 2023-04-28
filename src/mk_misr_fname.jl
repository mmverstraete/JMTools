"""
    misr_fname = mk_misr_fname(misr_prdct, misr_path;
        misr_orbit, misr_camera, misr_site, misr_version)

# Purpose:
Return a Vector of name(s) of the MISR data product file(s) corresponding to the specified input arguments.

# Required positional argument(s):
* `misr_prdct::AbstractString`: The MISR product acronym.
* `misr_path::Integer`: The MISR Path number.

# Optional keyword(s):
* `misr_orbit::Integer = 0`: The MISR Orbit number.
* `misr_camera::AbstractString = ""`: The MISR Camera name.
* `misr_site::AbstractString = ""`: The MISR Local Mode site name.
* `misr_version::AbstractString = ""`: The MISR product version identifier.

# Returned value(s):
* `misr_fname::Vector{AbstractString}`: The name(s) of the MISR data file(s) correponding to the input arguments.

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
* This function improves on the MISR Toolkit function `MtkMakeFilename.c` because it (1) requires only the needed input arguments and tests whether they are valid, (2) ignores unnecessary inputs, and (3) throws a meaningful error if a necessary input is missing or invalid.
* The input keyword arguments are optional, but if they are explicitly mentioned in the call to the function, their values must also be specified: default values are only provided if the keywords are absent in the call. See the first two examples below.
* This function cannot provide meaningful default values for the input keywords `misr_orbit`, `misr_camera`, and `misr_site`, but does use the most current `misr_version` label for the specified `misr_prdct` if that keyword is missing. Conversely, if the input keyword `misr_version` is specified, this function cannot verify its validity.
* This function always returns a `Vector` of file name(s).

# Example(s):
```julia
julia> using JMTools

julia> misr_fname = mk_misr_fname("AGP", 168)
"MISR_AM1_AGP_P168_F01_24.hdf"

julia> misr_fname = mk_misr_fname("AGP", 168; misr_orbit = 0, misr_camera = "", misr_site = "", misr_version = "")
"MISR_AM1_AGP_P168_F01_24_.hdf"

julia> misr_fname = mk_misr_fname("L1GMP", 168; misr_orbit = 68050)
"MISR_AM1_GP_GMP_P168_O068050_F03_0013_.hdf"

julia> misr_fname = mk_misr_fname("L1RCCM", 168; misr_orbit = 68050, misr_camera = "CF")
"MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025_.hdf"

julia> misr_orbit = 68050
68050

julia> misr_camera = "CF"
"CF"

julia> misr_fname = mk_misr_fname("L1RCCM", 168; misr_orbit = misr_orbit, misr_camera = misr_camera)
"MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf"

julia> misr_fname = mk_misr_fname("L1RTLM", 168; misr_orbit = 68050, misr_camera = "*", misr_site = "skukuza")
"MISR_AM1_GRP_TERRAIN_LM_P168_O068050_*_SITE_SKUKUZA_F03_0024.hdf"

julia> misr_fname = mk_misr_fname("L1GMP", 168; misr_orbit = 680500)
ERROR: mk_misr_fname: Invalid MISR Orbit number: must be in [995, 200000].

julia> misr_fname = mk_misr_fname("L1RCCM", 168; misr_orbit = 68050)
ERROR: mk_misr_fname: Missing MISR Camera name.
```
"""
function mk_misr_fname(
    misr_prdct::AbstractString,
    misr_path::Integer;
    misr_orbit::Integer = 0,
    misr_camera::AbstractString = "",
    misr_site::AbstractString = "",
    misr_version::AbstractString = ""
    )::Vector{AbstractString}

    # Set the list of cameras:
    cameras = ["DF", "CF", "BF", "AF", "AN", "AA", "BA", "CA", "DA"]

    # Check the required input arguments and set the string version of the MISR Path number:
    bool, prdct_name, prdct_ful_name, prdct_esdt = is_valid_misr_prdct(misr_prdct)
    if bool == false
        error("mk_misr_fname: Invalid MISR product acronym.")
    end
    bool, misr_path_string = is_valid_misr_path(misr_path)
    if bool == false
        error("mk_misr_fname: Invalid MISR Path number: must be in [1, 233].")
    end

    # Set the filename of an AGP file:
    if misr_prdct == "AGP"
        if misr_version == ""
            misr_version = current_misr_prdct_version(misr_prdct)
        end
        misr_fname = ["MISR_AM1" * "_" *
            prdct_name * "_" *
            misr_path_string * "_" *
            misr_version *
            ".hdf"]

    # Set the filename of an L1GMP file:
    elseif misr_prdct == "L1GMP"
        if misr_orbit == ""
            error("mk_misr_fname: Missing MISR Orbit number.")
        end
        bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
        if bool == false
            error("mk_misr_fname: Invalid MISR Orbit number: must be in [995, 200000].")
        end
        if misr_version == ""
            misr_version = current_misr_prdct_version(misr_prdct)
        end
        misr_fname = ["MISR_AM1" * "_" *
            prdct_name * "_" *
            misr_path_string * "_" *
            misr_orbit_string * "_" *
            misr_version *
            ".hdf"]

    # Set the filename of one or more L1REGM or L1RTGM (Global Mode) file(s):
    elseif (misr_prdct == "L1REGM") | (misr_prdct == "L1RTGM")
        if misr_orbit == ""
            error("mk_misr_fname: Missing MISR Orbit number.")
        end
        bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
        if bool == false
            error("mk_misr_fname: Invalid MISR Orbit number: must be in [995, 200000].")
        end
        if misr_camera == ""
            error("mk_misr_fname: Missing MISR Camera name.")
        end
        bool = is_valid_misr_camera(misr_camera)
        if bool == false
            error("mk_misr_fname: Invalid MISR Camera name: must be one of " * cameras *
                " or \"*\"].")
        end
        if misr_version == ""
            misr_version = current_misr_prdct_version(misr_prdct)
        end

        if misr_camera != "*"
            ncams = 1
            misr_fname = Vector{AbstractString}(undef, ncams)
            misr_fname[1] = "MISR_AM1" * "_" *
                prdct_name * "_" *
                misr_path_string * "_" *
                misr_orbit_string * "_" *
                misr_camera * "_" *
                misr_version *
                ".hdf"
        else
            ncams = length(cameras)
            misr_fname = Vector{AbstractString}(undef, ncams)
            for i = 1:ncams
                misr_fname[i] = "MISR_AM1" * "_" *
                    prdct_name * "_" *
                    misr_path_string * "_" *
                    misr_orbit_string * "_" *
                    cameras[i] * "_" *
                    misr_version *
                    ".hdf"
            end
        end

    # Set the filename of one or more L1RELM or L1RTLM (Local Mode) file(s):
    elseif (misr_prdct == "L1RELM") | (misr_prdct == "L1RTLM")
        if misr_orbit == ""
            error("mk_misr_fname: Missing MISR Orbit number.")
        end
        bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
        if bool == false
            error("mk_misr_fname: Invalid MISR Orbit number: must be in [995, 200000].")
        end
        if misr_camera == ""
            error("mk_misr_fname: Missing MISR Camera name.")
        end
        bool = is_valid_misr_camera(misr_camera)
        if bool == false
            error("mk_misr_fname: Invalid MISR Camera name: must be one of " * cameras *
                " or \"*\"].")
        end
        if misr_site == ""
            error("mk_misr_fname: Missing MISR site name.")
        end
        bool, misr_site_label = is_valid_misr_site(misr_site;
            cap = "TXT", sep = "_", sit = true, strict = true)
            if bool == false
            error("mk_misr_fname: " * misr_site_label)
        end
        if misr_version == ""
            misr_version = current_misr_prdct_version(misr_prdct)
        end

        if misr_camera != "*"
            ncams = 1
            misr_fname = Vector{AbstractString}(undef, ncams)
            misr_fname[1] = "MISR_AM1" * "_" *
                prdct_name * "_" *
                misr_path_string * "_" *
                misr_orbit_string * "_" *
                misr_camera * "_" *
                misr_site_label * "_" *
                misr_version *
                ".hdf"
        else
            ncams = length(cameras)
            misr_fname = Vector{AbstractString}(undef, ncams)
            for i = 1:ncams
                misr_fname[i] = "MISR_AM1" * "_" *
                    prdct_name * "_" *
                    misr_path_string * "_" *
                    misr_orbit_string * "_" *
                    cameras[i] * "_" *
                    misr_site_label * "_" *
                    misr_version *
                    ".hdf"
            end
        end

    # Set the filename of one or more L1RCCM file(s):
    elseif misr_prdct == "L1RCCM"
        if misr_orbit == ""
            error("mk_misr_fname: Missing MISR Orbit number.")
        end
        bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
        if bool == false
            error("mk_misr_fname: Invalid MISR Orbit number: must be in [995, 200000].")
        end
        if misr_camera == ""
            error("mk_misr_fname: Missing MISR Camera name.")
        end
        bool = is_valid_misr_camera(misr_camera)
        if bool == false
            error("mk_misr_fname: Invalid MISR Camera name: must be one of " * cameras *
                " or \"*\"].")
        end
        if misr_version == ""
            misr_version = current_misr_prdct_version(misr_prdct)
        end

        if misr_camera != "*"
            ncams = 1
            misr_fname = Vector{AbstractString}(undef, ncams)
            misr_fname[1] = "MISR_AM1" * "_" *
                prdct_name * "_" *
                misr_path_string * "_" *
                misr_orbit_string * "_" *
                misr_camera * "_" *
                misr_version *
                ".hdf"
        else
            ncams = length(cameras)
            misr_fname = Vector{AbstractString}(undef, ncams)
            for i = 1:ncams
                misr_fname[i] = "MISR_AM1" * "_" *
                    prdct_name * "_" *
                    misr_path_string * "_" *
                    misr_orbit_string * "_" *
                    cameras[i] * "_" *
                    misr_version *
                    ".hdf"
            end
        end

    # Set the filename of an L2AERO or L2LAND file:
    elseif (misr_prdct == "L2AERO") | (misr_prdct == "L2LAND")
        if misr_orbit == ""
            error("mk_misr_fname: Missing MISR Orbit number.")
        end
        bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
        if bool == false
            error("mk_misr_fname: Invalid MISR Orbit number: must be in [995, 200000].")
        end
        if misr_version == ""
            misr_version = current_misr_prdct_version(misr_prdct)
        end
        misr_fname = ["MISR_AM1" * "_" *
            prdct_name * "_" *
            misr_path_string * "_" *
            misr_orbit_string * "_" *
            misr_version *
            ".nc"]
    else
        error("mk_misr_fname: misr_prdct = ", misr_prdct * " not implemented yet.")
    end

    return misr_fname

end
