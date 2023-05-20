"""
    misr_fname = mk_misr_fname(misr_prdct, misr_path;
        misr_orbit = misr_orbit, misr_camera = misr_camera,
        misr_site = misr_site, misr_version = misr_version, ext = ext)

# Purpose:
Return a Vector of name(s) of the MISR data file(s) corresponding to the specified input arguments.

# Positional argument(s):
* `misr_prdct::AbstractString`: The MISR product acronym.
* `misr_path::Integer`: The MISR Path number.

# Keyword argument(s):
* `misr_orbit::Integer = 0`: The MISR Orbit number.
* `misr_camera::AbstractString = ""`: The MISR Camera name.
* `misr_site::AbstractString = ""`: The MISR Local Mode site name.
* `misr_version::AbstractString = ""`: The MISR product version identifier.
* `ext::Union{AbstractString, Nothing} = nothing`: The file extension.

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
* This function improves on the MISR Toolkit function `MtkMakeFilename.c` because (1) it only requires and tests the validity of the arguments actually required (i.e., it ignores unnecessary inputs), (2) it generates a meaningful error if a necessary input is missing or invalid, and (3) it accepts "*" as a valid camera name specification, in which case the output argument `misr_fname` is a `Vector` of 9 values, one for each camera.
* The input keyword arguments are optional, but if they are explicitly mentioned in the call to the function, their values must also be specified: default values are only provided if the keywords are absent in the call. See the first two examples below.
* This function cannot provide meaningful default values for the input keywords `misr_orbit`, `misr_camera`, and `misr_site`, but does use the most current `misr_version` label for the specified `misr_prdct` if that keyword is missing. Conversely, if the input keyword `misr_version` is specified, this function cannot verify its validity.
* This function always returns a `Vector` of file name(s).

# Example(s):
```julia
julia> using JMTools

julia> misr_fname = mk_misr_fname("AGP", 168)
1-element Vector{AbstractString}:
 "MISR_AM1_AGP_P168_F01_24.hdf"

 julia> misr_fname = mk_misr_fname("AGP", 168; misr_orbit = 0, misr_camera = "",
 misr_site = nothing, misr_version = "")
1-element Vector{AbstractString}:
 "MISR_AM1_AGP_P168_F01_24.hdf"

julia> misr_fname = mk_misr_fname("L1GMP", 168; misr_orbit = 68050)
1-element Vector{AbstractString}:
 "MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf"

julia> misr_fname = mk_misr_fname("L1RCCM", 168; misr_orbit = 68050, misr_camera = "CF")
1-element Vector{AbstractString}:
 "MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf"

julia> misr_fname = mk_misr_fname("L1RCCM", 168; misr_orbit = 68050, misr_camera = "CF")
1-element Vector{AbstractString}:
 "MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf"

julia> misr_fname = mk_misr_fname("L1RTGM", 168; misr_orbit = 68500, misr_camera = "*")
9-element Vector{AbstractString}:
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_DF_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_CF_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_BF_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_AF_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_AN_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_AA_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_BA_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_CA_F03_0024.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068500_DA_F03_0024.hdf"

julia> misr_fname = mk_misr_fname("L1GMP", 168; misr_orbit = 680500)
ERROR: mk_misr_fname: Invalid MISR Orbit.

julia> misr_fname = mk_misr_fname("L1RCCM", 168; misr_orbit = 68050)
ERROR: mk_misr_fname: MISR Camera is missing.
```
"""
function mk_misr_fname(
    misr_prdct::AbstractString = "",
    misr_path::Integer = 0;
    misr_orbit::Union{Integer, Nothing} = nothing,
    misr_camera::Union{AbstractString, Nothing} = nothing,
    misr_site::Union{AbstractString, Nothing} = nothing,
    misr_version::Union{AbstractString, Nothing} = nothing,
    ext::Union{AbstractString, Nothing} = nothing
    )::Vector{AbstractString}

    # Check the positional argument(s):
    # All MISR files include a product name:
    if misr_prdct != ""
        bool, prdct_name, prdct_ful_name, prdct_esdt = is_valid_misr_prdct(misr_prdct)
        if bool == false
            error("mk_misr_fname: Invalid MISR product acronym.")
        end
    else
        error("mk_misr_fname: MISR product acronym is missing.")
    end

    # All MISR files include a Path number:
    if misr_path != 0
        bool, misr_path_string = is_valid_misr_path(misr_path)
        if bool == false
            error("mk_misr_fname: Invalid MISR Path.")
        end
    else
        error("mk_misr_fname: MISR Path is missing.")
    end

    # Check the keyword parameter(s):
    # All MISR files except AGP files include an Orbit number:
    if misr_prdct != "AGP"
        if misr_orbit !== nothing
            bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
            if bool == false
                error("mk_misr_fname: Invalid MISR Orbit.")
            end
        else
            error("mk_misr_fname: MISR Orbit is missing.")
        end
    end

    # Only some L1 files include MISR Camera names:
    if (misr_prdct == "L1BROW") |
        (misr_prdct == "L1REGM") |
        (misr_prdct == "L1RTGM") |
        (misr_prdct == "L1RELM") |
        (misr_prdct == "L1RTLM") |
        (misr_prdct == "L1RCCM")
        if misr_camera !== nothing
            bool = is_valid_misr_camera(misr_camera) | (misr_camera === "*")
            if bool == false
                error("mk_misr_fname: Invalid MISR Camera.")
            end
        else
            error("mk_misr_fname: MISR Camera is missing.")
        end
    end

    # Only Local Mode files include a Site name:
    if (misr_prdct == "L1RELM") |
        (misr_prdct == "L1RTLM")
        if misr_site !== nothing
            bool, misr_site_label = is_valid_misr_site(misr_site;
                cap = "TXT", sep = "_", sit = true, strict = true)
            if bool == false
                error("mk_misr_fname: Invalid MISR Local Site.")
            end
        else
            error("mk_misr_fname: MISR Local Site is missing.")
        end
    end

    # All MISR files include a Version identifier:
    if misr_version === nothing
        misr_version = current_prdct_version(misr_prdct)
    elseif misr_version === ""
        misr_version = current_prdct_version(misr_prdct)
    end

    # All MISR files include a file extension:
    if ext === nothing
        if (misr_prdct != "L2AERO") & (misr_prdct != "L2LAND")
            ext = ".hdf"
        else
            ext = ".nc"
        end
    elseif ext === ""
            error("mk_misr_fname: File extension cannot be an empty string.")
    else
        if ext[1] != '.'
            error("mk_misr_fname: File extension must start with a dot.")
        end
    end

    # Get the technical specifications of the MISR instrument:
    misr_specs = set_misr_specs()

    # Set the filename of an AGP file:
    if misr_prdct == "AGP"
        misr_fname = ["MISR_AM1" * "_" *
            prdct_name * "_" *
            misr_path_string * "_" *
            misr_version *
            ext]

    # Set the filename of an L1BROW file:
    elseif misr_prdct == "L1BROW"
        if misr_camera != "*"
            misr_fname = Vector{AbstractString}(undef, 1)
            misr_fname[1] = "MISR_AM1" * "_" *
                prdct_name * "_" *
                misr_path_string * "_" *
                misr_orbit_string * "_" *
                misr_camera * "_" *
                misr_version *
                ext
        else
            misr_fname = Vector{AbstractString}(undef, misr_specs.ncameras)
            for i = 1:misr_specs.ncameras
                misr_fname[i] = "MISR_AM1" * "_" *
                    prdct_name * "_" *
                    misr_path_string * "_" *
                    misr_orbit_string * "_" *
                    misr_specs.camera_names[i] * "_" *
                    misr_version *
                    ext
            end
        end

    # Set the filename of an L1GMP file:
    elseif misr_prdct == "L1GMP"
        misr_fname = ["MISR_AM1" * "_" *
        prdct_name * "_" *
        misr_path_string * "_" *
        misr_orbit_string * "_" *
        misr_version *
        ext]

    # Set the filename of one or more L1REGM or L1RTGM (Global Mode) file(s):
    elseif (misr_prdct == "L1REGM") | (misr_prdct == "L1RTGM")
        if misr_camera != "*"
            misr_fname = Vector{AbstractString}(undef, 1)
            misr_fname[1] = "MISR_AM1" * "_" *
                prdct_name * "_" *
                misr_path_string * "_" *
                misr_orbit_string * "_" *
                misr_camera * "_" *
                misr_version *
                ext
        else
            misr_fname = Vector{AbstractString}(undef, misr_specs.ncameras)
            for i = 1:misr_specs.ncameras
                misr_fname[i] = "MISR_AM1" * "_" *
                    prdct_name * "_" *
                    misr_path_string * "_" *
                    misr_orbit_string * "_" *
                    misr_specs.camera_names[i] * "_" *
                    misr_version *
                    ext
            end
        end

    # Set the filename of one or more L1RELM or L1RTLM (Local Mode) file(s):
    elseif (misr_prdct == "L1RELM") | (misr_prdct == "L1RTLM")
        if misr_camera != "*"
            misr_fname = Vector{AbstractString}(undef, 1)
            misr_fname[1] = "MISR_AM1" * "_" *
                prdct_name * "_" *
                misr_path_string * "_" *
                misr_orbit_string * "_" *
                misr_camera * "_" *
                misr_site_label * "_" *
                misr_version *
                ext
        else
            misr_fname = Vector{AbstractString}(undef, misr_specs.ncameras)
            for i = 1:misr_specs.ncameras
                misr_fname[i] = "MISR_AM1" * "_" *
                    prdct_name * "_" *
                    misr_path_string * "_" *
                    misr_orbit_string * "_" *
                    misr_specs.camera_names[i] * "_" *
                    misr_site_label * "_" *
                    misr_version *
                    ext
            end
        end

    # Set the filename of one or more L1RCCM file(s):
    elseif misr_prdct == "L1RCCM"
        if misr_camera != "*"
            misr_fname = Vector{AbstractString}(undef, 1)
            misr_fname[1] = "MISR_AM1" * "_" *
                prdct_name * "_" *
                misr_path_string * "_" *
                misr_orbit_string * "_" *
                misr_camera * "_" *
                misr_version *
                ext
        else
            misr_fname = Vector{AbstractString}(undef, misr_specs.ncameras)
            for i = 1:misr_specs.ncameras
                misr_fname[i] = "MISR_AM1" * "_" *
                    prdct_name * "_" *
                    misr_path_string * "_" *
                    misr_orbit_string * "_" *
                    misr_specs.camera_names[i] * "_" *
                    misr_version *
                    ext
            end
        end

    # Set the filename of an L2AERO or L2LAND file:
    elseif (misr_prdct == "L2AERO") | (misr_prdct == "L2LAND")
        misr_fname = ["MISR_AM1" * "_" *
            prdct_name * "_" *
            misr_path_string * "_" *
            misr_orbit_string * "_" *
            misr_version *
            ext]

        else
        error("mk_misr_fname: misr_prdct = " * misr_prdct * " not implemented yet.")
    end

    return misr_fname

end
