"""
    misrhr_fname = make_misrhr_fname(misrhr_prdct, misr_path, misr_orbit, misr_block;
        misr_camera = misr_camera, misr_version = misr_version,
        misrhr_version = misrhr_version, rpv_suffix = rpv_suffix,
        tip_suffix = tip_suffix, ext = ext)

# Purpose(s):
* Return a `Vector` of one or nine name(s) of MISR-HR product file(s) corresponding to the arguments.

# Positional argument(s):
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.
* `misr_path::Integer`: The MISR Path number.
* `misr_orbit::Integer`: The MISR Orbit number.
* `misr_block::Integer`: The MISR Block number.

# Keyword argument(s):
* `misr_camera::Union{AbstractString, Nothing} = nothing`: The MISR Camera name.
* `misr_version::Union{AbstractString, Nothing} = nothing`: The MISR product version identifier.
* `misrhr_version::Union{AbstractString, Nothing} = nothing`: The MISR-HR product version identifier.
* `rpv_suffix::Union{AbstractString, Nothing} = nothing`: The RPV suffix.
* `tip_suffix::Union{AbstractString, Nothing} = nothing`: The TIP suffix.
* `ext::Union{AbstractString, Nothing} = nothing`: The file extension.

# Return value(s):
* `misrhr_fname::Vector{AbstractString}`: The name(s) of the one or nine MISR-HR product file(s) corresponding to the arguments.

# Algorithm:
* This function assembles the filename of the MISR-HR product corresponding to the arguments as follows:
- The positional arguments `misr_prdct`, `misr_path`, `misr_orbit` and `misr_block` are used to initialize the output vector `misrhr_fname`, which is then completed as specified by the keyword arguments as needed.
- The keyword argument `misr_camera` is only required to generate the filename of a `L1B3` product. This function accepts "*" as a valid `misr_camera` specification, in which case the output value `misrhr_fname` is a `Vector` of 9 values, one for each camera.
- If the keyword arguments `misr_version` and/or `misrhr_version` are not provided, a default value is set by the function `set_current_prdct_version.jl`.
- The keyword argument `rpv_suffix` is only used to generate the name of a `RPV` product. If it is not provided explicitly, the default value is `"SL"`.
- The keyword argument `tip_suffix` is only required to generate the name of a `TIP` product. If it is not provided explicitly, the default value is `"GRN"`.
- If the keyword argument `ext` is not provided, a default value is set depending on the positional argument `misrhr_prdct`.

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

# Note(s):
* This function accepts "*" as a valid `misr_camera` specification, in which case the output value `misrhr_fname` is a `Vector` of 9 values, one for each camera.
* This function verifies the validity of all arguments except `misr_version` and `misrhr_version`, and does not check the existence or validity of the output value.
* This function always returns a `Vector` of 1 or 9 file name(s).

# Example 1:
```julia
julia> using JMTools

julia> misrhr_fname = make_misrhr_fname("L1B3", 168, 68050, 110;
    misr_camera = "AN", misrhr_version = "V2.00-1")
1-element Vector{AbstractString}:
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.00-1.hdf"
```

# Example 2:
```julia
julia> using JMTools

julia> misrhr_fname = make_misrhr_fname("L1B3", 168, 68050, 110; misr_camera = "*")
9-element Vector{AbstractString}:
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.B110_MISRHR_V2.02-0.hdf"
 "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.B110_MISRHR_V2.02-0.hdf"
```

# Example 3:
```julia
julia> using JMTools

julia> misrhr_fname = make_misrhr_fname("BRF", 168, 68050, 110)
"MISR_HR_BRF_2012-10-03_P168_O068050_B110_V2.02-0.hdf"
```

# Example 4:
```julia
julia> using JMTools

julia> misrhr_fname = make_misrhr_fname("RPV", 168, 68050, 110)
"MISR_HR_RPV_2012-10-03_P168_O068050_B110_V2.02-0_SL.hdf"
```

# Example 5:
```julia
julia> using JMTools

julia> misrhr_fname = make_misrhr_fname("TIP", 168, 68050, 110)
"MISR_HR_TIP_2012-10-03_P168_O068050_B110_V2.02-0_GRN.hdf"
```
"""
function make_misrhr_fname(
    misrhr_prdct::AbstractString,
    misr_path::Integer,
    misr_orbit::Integer,
    misr_block::Integer;
    misr_camera::Union{AbstractString, Nothing} = nothing,
    misr_version::Union{AbstractString, Nothing} = nothing,
    misrhr_version::Union{AbstractString, Nothing} = nothing,
    rpv_suffix::Union{AbstractString, Nothing} = nothing,
    tip_suffix::Union{AbstractString, Nothing} = nothing,
    ext::Union{AbstractString, Nothing} = nothing
    )::Vector{AbstractString}

    # Check the positional argument(s):
    # All MISR files include a product name:
    if misrhr_prdct != ""
        bool, prdct_full_name = is_valid_misrhr_prdct(misrhr_prdct)
        if bool == false
            error("make_misrhr_fname: Invalid MISR-HR product acronym.")
        end
    else
        error("make_misrhr_fname: MISR-HR product acronym is missing.")
    end

    # All MISR-HR files include a MISR Path number:
    if misr_path != 0
        bool, misr_path_string = is_valid_misr_path(misr_path)
        if bool == false
            error("make_misrhr_fname: Invalid MISR Path.")
        end
    else
        error("make_misrhr_fname: MISR Path is missing.")
    end

    # All MISR-HR files include a MISR Orbit number:
    if misr_orbit != 0
        bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
        if bool == false
            error("make_misrhr_fname: Invalid MISR Orbit.")
        end
    else
        error("make_misrhr_fname: MISR Orbit is missing.")
    end

    # All MISR-HR files include a MISR Block number:
    if misr_block != 0
        bool, misr_block_string = is_valid_misr_block(misr_block)
        if bool == false
            error("make_misrhr_fname: Invalid MISR Block.")
        end
    else
        error("make_misrhr_fname: MISR Block is missing.")
    end

    # Check the keyword argument(s):
    # Only MISR-HR L1B3 files include MISR Camera names:
    if misrhr_prdct == "L1B3"
        if misr_camera !== nothing
            bool = is_valid_misr_camera(misr_camera) | (misr_camera === "*")
            if bool != true
                error("make_misrhr_fname: Argument misr_camera is invalid.")
            end
        else
            error("make_misrhr_fname: MISR Camera is missing.")
        end
    end

    # All MISR-HR files include a Version identifier:
    if (misrhr_version === nothing) | (misrhr_version === "")
        misrhr_version = set_current_prdct_version(misrhr_prdct)
    end

    # All MISR-HR files include a file extension:
    if ext === nothing
        if first(misrhr_version, 1) == 'v'
            ext = ".nc"
        else
            ext = ".hdf"
        end
    end

    # Get the technical specifications of the MISR instrument:
    misr_specs = set_misr_specs()

    # Retrieve the date of acquisition of the specified MISR Orbit:
    fmt = nothing
    orbit_date, orbit_date_string = orbit2date(misr_orbit; fmt)

    # Set the filename(s) of a MISR-HR L1B3 product file by modifying the name of the corresponding MISR L1RTGM data file:
    if misrhr_prdct == "L1B3"
        misr_fname = make_misr_fname("L1RTGM", misr_path;
            misr_orbit = misr_orbit, misr_camera = misr_camera,
            misr_version = misr_version, ext = ext)
        if misr_camera == "*"
            misrhr_fname = Vector{AbstractString}(undef, misr_specs.ncameras)
            for cam = 1:misr_specs.ncameras
                header = chop(misr_fname[cam]; head = 0, tail = 4)
                misrhr_fname[cam] = header * "." * misr_block_string * "_MISRHR_" * misrhr_version * ext
            end
        else
            misrhr_fname = Vector{AbstractString}(undef, 1)
            header = chop(misr_fname[1]; head = 0, tail = 4)
            misrhr_fname[1] = header * "." * misr_block_string * "_MISRHR_" * misrhr_version * ext
        end

    # Set the filename of a MISR-HR BRF product file:
    elseif misrhr_prdct == "BRF"
        misrhr_fname = Vector{AbstractString}(undef, 1)
        misrhr_fname[1] = "MISR_HR" * '_' *
            misrhr_prdct * '_' *
            orbit_date_string * '_' *
            misr_path_string * '_' *
            misr_orbit_string * '_' *
            misr_block_string * '_' *
            misrhr_version * ext

    # Set the filename of a MISR-HR RPV product file:
    elseif misrhr_prdct == "RPV"
        misrhr_fname = Vector{AbstractString}(undef, 1)
        misrhr_fname[1] = "MISR_HR" * '_' *
            misrhr_prdct * '_' *
            orbit_date_string * '_' *
            misr_path_string * '_' *
            misr_orbit_string * '_' *
            misr_block_string * '_' *
            misrhr_version
        if rpv_suffix !== nothing
            misrhr_fname[1] = misrhr_fname[1] * '_' * rpv_suffix * ext
        else
            misrhr_fname[1] = misrhr_fname[1] * '_' * "SL" * ext
        end

    # Set the filename of a MISR-HR TIP product file:
    elseif misrhr_prdct == "TIP"
        misrhr_fname = Vector{AbstractString}(undef, 1)
        misrhr_fname[1] = "MISR_HR" * '_' *
            misrhr_prdct * '_' *
            orbit_date_string * '_' *
            misr_path_string * '_' *
            misr_orbit_string * '_' *
            misr_block_string * '_' *
            misrhr_version
        if tip_suffix !== nothing
            misrhr_fname[1] = misrhr_fname[1] * '_' * tip_suffix
        else
            misrhr_fname[1] = misrhr_fname[1] * '_' * "GRN" * ext
        end

    else
        error("make_misrhr_fname: Unrecognized misrhr_prdct.")
    end

    return misrhr_fname

end
