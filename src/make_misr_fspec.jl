"""
    misr_fspec = make_misr_fspec(misr_prdct, misr_path;
        misr_orbit = 0, misr_camera = "", misr_site = "", misr_version = "")

# Purpose(s):
* Return the specification (path and name) of the MISR data product file(s) corresponding to the specified arguments.

# Positional argument(s):
* `misr_prdct::AbstractString`: The MISR product acronym.
* `misr_path::Integer`: The MISR Path number.

# Keyword argument(s):
* `misr_orbit::Union{Integer, Nothing} = nothing`: The MISR Orbit number.
* `misr_camera::Union{AbstractString, Nothing} = nothing`: The MISR Camera name.
* `misr_site::Union{AbstractString, Nothing} = nothing`: The MISR Local Mode site name.
* `misr_version::Union{AbstractString, Nothing} = nothing`: The MISR product version identifier.

# Return value(s):
* `misr_fspec::Vector{AbstractString}`: The specification(s) (path(s) and name(s)) of the MISR data file(s) correponding to the input arguments.

# Algorithm:
* This function assembles the file specification (path and name) of the MISR data set corresponding to the arguments as follows:
- Function `make_misr_fpath.jl` is called to generate the absolute path to the file.
- Function `make_misr_fname.jl` is called to generate the name of the file.
- These elements are concatenated to create a `Vector` of 1 or 9 file specifications, as appropriate.

# Reference(s):
* The MISR-HR Processing System Manual.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia wrapper: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
1. This function assumes that MISR data file(s) are organized as described in the User Manual.

# Example 1:
```julia
julia> using JMTools

julia> misr_fspec = make_misr_fspec("L1RTGM", 168;
           misr_orbit = 68050, misr_camera = "AN", misr_site = "", misr_version = "")
"/Volumes/MISR_Data0/P168/L1RTGM/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
```

# Example 2:
```
julia> using JMTools

julia> misr_fspec = make_misr_fspec("L1RCCM", 168;
    misr_orbit = 68050, misr_camera = "*")
9-element Vector{AbstractString}:
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_DF_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_CF_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_BF_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_AF_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_AN_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_AA_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_BA_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_CA_F04_0025.hdf"
 "/Volumes/MISR_Data0/P168/L1RCCM" ⋯ 19 bytes ⋯ "GM_P168_O068050_DA_F04_0025.hdf"
```
"""
function make_misr_fspec(
    misr_prdct::AbstractString,
    misr_path::Integer;
    misr_orbit::Union{Integer, Nothing} = nothing,
    misr_camera::Union{AbstractString, Nothing} = nothing,
    misr_site::Union{AbstractString, Nothing} = nothing,
    misr_version::Union{AbstractString, Nothing} = nothing,
    )::Vector{AbstractString}

    # Set the name of the folder containing the data file(s):
    misr_fpath = make_misr_fpath(misr_prdct, misr_path)

    # Set the name(s) of the data file(s):
    misr_fname = make_misr_fname(misr_prdct, misr_path;
        misr_orbit, misr_camera, misr_site, misr_version)

    # Generate the file specification(s) of the desired data file(s):
    nfiles = length(misr_fname)
    if nfiles == 1
        misr_fspec = [misr_fpath * misr_fname[1]]
    else
        misr_fspec = Vector{AbstractString}(undef, nfiles)
        for i = 1:nfiles
            misr_fspec[i] = misr_fpath * misr_fname[i]
        end
    end

    return misr_fspec

end
