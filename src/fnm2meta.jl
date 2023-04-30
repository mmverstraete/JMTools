"""
    misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta(fspec)

# Purpose:
This function disassembles the name of the MISR file specification `fspec` and returns the metadata elements.

# Required positional argument(s):
* `fspec::AbstractString`: The name of the MISR data file specification (optional path and name).

# Optional keyword(s): None.

# Returned value(s):
* `misr_prdct_id::AbstractString`: The MISR product acronym.
* `misr_mode_id::AbstractString`: The MISR Mode (Global or Local).
* `misr_path_id::Integer`: The MISR Path number.
* `misr_orbit_id::Integer`: The MISR Orbit number.
* `misr_camera_id::AbstractString`: The MISR Camera name.
* `misr_site_id::AbstractString`: The MISR Local Mode site name.
* `misr_version_id::AbstractString`: The MISR Version identifier.
* `ext_id::AbstractString`: The filename extension.

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
* This function accepts only properly formatted MISR filenames as input. If the input argument `fspec` is unrecognized, all returned values are null.
* Returned values are also null if the corresponding component is not present in the input file specification.
* This function does not check whether the returned values are valid.

# Example(s):
```julia
julia> misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta("MISR_AM1_GP_GMP_P168_O068050_F03_0013.hdf")
("L1GMP", "", 168, 68050, "", "", "F03_0013", ".hdf")

julia> misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta("MISR_AM1_GRP_ELLIPSOID_GM_P168_O068050_CF_F03_0024.hdf")
("L1REGM", "GM", 168, 68050, "CF", "", "F03_0024", ".hdf")

julia> misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta("MISR_AM1_GRP_TERRAIN_LM_P168_O068050_BA_SITE_SKUKUZA_F03_0024.hdf")
("L1RTLM", "LM", 168, 68050, "BA", "SITE_SKUKUZA", "F03_0024", ".hdf")

julia> misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta("MISR_AM1_AS_LAND_P168_O068050_F08_0023.nc")
("L2LAND", "", 168, 68050, "", "", "F08_0023", ".nc")
```
"""
function fnm2meta(
    fspec::AbstractString
    )::Tuple{AbstractString, AbstractString, Integer, Integer, AbstractString, AbstractString, AbstractString, AbstractString}

    # Initialize the returned values:
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

    # Extract the MISR Orbit number and the following underscore character:
    otest = fname[1:8]
    if otest[1] == 'O'
        misr_orbit_id = parse(Int, otest[2:7])
        fname = fname[9:lastindex(fname)]
    end

    # Extract the MISR Camera name and the following underscore character:
    ctest = fname[1:3]
    if is_valid_misr_camera(ctest[1:2])
        misr_camera_id = ctest[1:2]
        fname = fname[4:lastindex(fname)]
    end

    # Extract the MISR Version identifier at the end of fname:
    vtest = fname[1]
    if vtest == 'F'
        misr_version_id = fname
    else
        xtest = findfirst("_F", fname)
        misr_version_id = fname[xtest[2]:lastindex(fname)]
        fname = fname[1:xtest[1] - 1]

    # Extract the MISR Local Mode Site name and the following underscore character:
        if (misr_prdct_id == "L1RELM") | (misr_prdct_id == "L1RTLM")
            stest = fname[1:5]
            if stest == "SITE_"
                misr_site_id = fname
            end
        end
    end

    return misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id

end
