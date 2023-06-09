"""
    fnm_meta = fnm2meta(fspec)

# Purpose(s):
This function disassembles the MISR file specification `fspec` and returns the metadata elements as a `Named Tuple`.

# Required positional argument(s):
* `fspec::AbstractString`: The name of the MISR data file specification (optional path and name).

# Optional keyword(s): None.

# Returned value(s):
* `fnm_meta::NamedTuple{(:misr_prdct_id, :misr_mode_id, :misr_path_id, :misr_orbit_id, :misr_camera_id, :misr_site_id, :misr_version_id, :ext_id),
    Tuple{String, String, Int64, Int64, String, String, String, String}}`: The metadata elements retrieved from the MISR data file specification.

where
- `misr_prdct_id::AbstractString`: The MISR product acronym.
- `misr_mode_id::AbstractString`: The MISR Mode (Global or Local).
- `misr_path_id::Integer`: The MISR Path number.
- `misr_orbit_id::Integer`: The MISR Orbit number.
- `misr_camera_id::AbstractString`: The MISR Camera name.
- `misr_site_id::AbstractString`: The MISR Local Mode site name.
- `misr_version_id::AbstractString`: The MISR Version identifier.
- `ext_id::AbstractString`: The filename extension.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* This function may execute faster than the JMtk15 functions `jMtkFileToPath`, `jMtkFileToOrbit`, etc. because it only analyzes the filename, and does not need to open the file (which does not need to exist or be accessible).
* This function accepts only properly formatted MISR filenames as input. If the input argument `fspec` is unrecognized, all returned values are set to `0` or a null string.
* Returned values are also null if the corresponding component is not present in the input file specification.
* This function does not check whether the returned values are valid.
* Elements of the return value can be accessed by their rank or by their names: See the first example below.

# Example(s):
```julia
julia> using JMTools

julia> fnm_meta = fnm2meta("MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf")
(misr_prdct_id = "L1GMP", misr_mode_id = "", misr_path_id = 168, misr_orbit_id = 68050, misr_camera_id = "", misr_site_id = "", misr_version_id = "F03_0013", ext_id = ".hdf")

julia> fnm_meta[3]
168

julia> fnm_meta.misr_orbit_id
68050

julia> fnm_meta = fnm2meta("MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CF_F03_0024.hdf")
(misr_prdct_id = "L1REGM", misr_mode_id = "GM", misr_path_id = 168, misr_orbit_id = 68050, misr_camera_id = "CF", misr_site_id = "", misr_version_id = "F03_0024", ext_id = ".hdf")

julia> fnm_meta = fnm2meta("MISR_AM1_GRP_TERRAIN_LM_P168_O068050_BA_SITE_SKUKUZA_F03_0024.hdf")
(misr_prdct_id = "L1RTLM", misr_mode_id = "LM", misr_path_id = 168, misr_orbit_id = 68050, misr_camera_id = "BA", misr_site_id = "SITE_SKUKUZA", misr_version_id = "F03_0024", ext_id = ".hdf")

julia> fnm_meta = fnm2meta("MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc")
(misr_prdct_id = "L2LAND", misr_mode_id = "", misr_path_id = 168, misr_orbit_id = 68050, misr_camera_id = "", misr_site_id = "", misr_version_id = "F08_0023", ext_id = ".nc")
```
"""
function fnm2meta(
    fspec::AbstractString
    )::NamedTuple{(:misr_prdct_id, :misr_mode_id, :misr_path_id, :misr_orbit_id, :misr_camera_id, :misr_site_id, :misr_version_id, :ext_id),
        Tuple{String, String, Int64, Int64, String, String, String, String}}
    
    # Initialize the metadata elements:
    misr_prdct_id = ""
    misr_mode_id = ""
    misr_path_id = 0
    misr_orbit_id = 0
    misr_camera_id = ""
    misr_site_id = ""
    misr_version_id = ""
    ext_id = ""

    # Separate the optional path, the filename and the file extension with the dot character:
    fpath, fname = splitdir(fspec)
    fname, ext_id = splitext(fname)

    # Check that fname is nominally a MISR file, and strip that header:
    if fname[1:9] != "MISR_AM1_"
        return misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id
    end
    fname = fname[10:lastindex(fname)]

    # Check the various MISR product types, and if one is identified, set the product acronym, set the MISR Mode, and strip the product identifier from fname:
    if fname[1:4] == "AGP_"
        misr_prdct_id = "AGP"
        misr_mode_id = ""
        fname = fname[5:lastindex(fname)]
    elseif fname[1:20] == "GRP_ELLIPSOID_BR_GM_"
        misr_prdct_id = "L1BROW"
        misr_mode_id = "GM"
        fname = fname[21:lastindex(fname)]
    elseif fname[1:7] == "GP_GMP_"
        misr_prdct_id = "L1GMP"
        misr_mode_id = ""
        fname = fname[8:lastindex(fname)]
    elseif fname[1:17] == "GRP_ELLIPSOID_GM_"
        misr_prdct_id = "L1REGM"
        misr_mode_id = "GM"
        fname = fname[18:lastindex(fname)]
    elseif fname[1:17] == "GRP_ELLIPSOID_LM_"
        misr_prdct_id = "L1RELM"
        misr_mode_id = "LM"
        fname = fname[18:lastindex(fname)]
    elseif fname[1:15] == "GRP_TERRAIN_GM_"
        misr_prdct_id = "L1RTGM"
        misr_mode_id = "GM"
        fname = fname[16:lastindex(fname)]
    elseif fname[1:15] == "GRP_TERRAIN_LM_"
        misr_prdct_id = "L1RTLM"
        misr_mode_id = "LM"
        fname = fname[16:lastindex(fname)]
    elseif fname[1:12] == "GRP_RCCM_GM_"
        misr_prdct_id = "L1RCCM"
        misr_mode_id = "GM"
        fname = fname[13:lastindex(fname)]
    elseif fname[1:10] == "TC_ALBEDO_"
        misr_prdct_id = "L2TALBEDO"
        misr_mode_id = ""
        fname = fname[11:lastindex(fname)]
    elseif fname[1:15] == "TC_CLASSIFIERS_"
        misr_prdct_id = "L2TCLASS"
        misr_mode_id = ""
        fname = fname[16:lastindex(fname)]
    elseif fname[1:9] == "TC_CLOUD_"
        misr_prdct_id = "L2TCLOUD"
        misr_mode_id = ""
        fname = fname[10:lastindex(fname)]
    elseif fname[1:10] == "TC_STEREO_"
        misr_prdct_id = "L2TSTEREO"
        misr_mode_id = ""
        fname = fname[11:lastindex(fname)]
    elseif fname[1:11] == "AS_AEROSOL_"
        misr_prdct_id = "L2AERO"
        misr_mode_id = ""
        fname = fname[12:lastindex(fname)]
    elseif fname[1:8] == "AS_LAND_"
        misr_prdct_id = "L2LAND"
        misr_mode_id = ""
        fname = fname[9:lastindex(fname)]
    else
        error("fnm2meta: MISR product type not recognized.")
    end

    # Extract the MISR Path number and the following underscore character:
    ptest = fname[1:5]
    if ptest[1] == 'P'
        misr_path_id = parse(Int, ptest[2:4])
        fname = fname[6:lastindex(fname)]
    end

    # Extract the MISR Orbit number and the following underscore character for all MISR product types except AGP:
    if (misr_prdct_id != "AGP")
        otest = fname[1:8]
        if otest[1] == 'O'
            misr_orbit_id = parse(Int, otest[2:7])
            fname = fname[9:lastindex(fname)]
        end
    end

    # Extract the MISR Camera name and the following underscore character for all MISR product type acronyms except AGP, L1GMP, L2TALBEDO, L2TCLASS, L2TCLOUD, L2TSTEREO, L2AERO, L2LAND:
    if (misr_prdct_id != "AGP") &
        (misr_prdct_id != "L1GMP") &
        (misr_prdct_id != "L2TALBEDO") &
        (misr_prdct_id != "L2TCLASS") &
        (misr_prdct_id != "L2TCLOUD") &
        (misr_prdct_id != "L2TSTEREO") &
        (misr_prdct_id != "L2AERO") &
        (misr_prdct_id != "L2LAND")
        ctest = fname[1:3]
        if is_valid_misr_camera(ctest[1:2])
            misr_camera_id = ctest[1:2]
            fname = fname[4:lastindex(fname)]
        end
    end

    # Extract the MISR Version identifier at the end of fname:
    vtest = fname[1]
    if vtest == 'F'
        misr_version_id = fname
        misr_site_id = ""
    else
        xtest = findlast("_F", fname)
        misr_version_id = fname[xtest[2]:lastindex(fname)]
        fname = fname[1:xtest[1] - 1]

    # Extract the MISR Local Mode Site name and the following underscore character:
        if ((misr_prdct_id == "L1RELM") |
            (misr_prdct_id == "L1RTLM")) &
            (fname[1:5] == "SITE_")
                misr_site_id = fname
        else
            error("fnm2meta: Invalid MISR site name.")
        end
    end

    fnm_meta = (misr_prdct_id = misr_prdct_id,
        misr_mode_id = misr_mode_id,
        misr_path_id = misr_path_id,
        misr_orbit_id = misr_orbit_id,
        misr_camera_id = misr_camera_id,
        misr_site_id = misr_site_id,
        misr_version_id = misr_version_id,
        ext_id = ext_id)

        return fnm_meta

end
