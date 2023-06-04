"""
    misrhr_fspec = make_misrhr_fspec(misrhr_prdct, misr_path, misr_orbit, misr_block;
        misrhr_subprdct = misrhr_subprdct, misr_camera = misr_camera,
        misr_version = misr_version, misrhr_version = misrhr_version, 
        rpv_suffix = rpv_suffix, tip_suffix = tip_suffix,
        ext = ext, misrhr_fpath = misrhr_fpath)

# Purpose(s):
* Return a `Vector` of one or nine specification(s) (path and name) for the MISR-HR product file(s) corresponding to the specified arguments.

# Positional argument(s):
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.
* `misr_path::Integer`: The MISR Path number.
* `misr_orbit::Integer`: The MISR Orbit number.
* `misr_block::Integer`: The MISR Block number.

# Keyword argument(s):
* `misrhr_subprdct::Union{AbstractString, Nothing} = nothing`: The MISR-HR subproduct acronym.
* `misr_camera::Union{AbstractString, Nothing} = nothing`: The MISR Camera name.
* `misr_version::Union{AbstractString, Nothing} = nothing`: The MISR product version identifier.
* `misrhr_version::Union{AbstractString, Nothing} = nothing`: The MISR-HR product version identifier.
* `rpv_suffix::Union{AbstractString, Nothing} = nothing`: The RPV suffix.
* `tip_suffix::Union{AbstractString, Nothing} = nothing`: The TIP suffix.
* `ext::Union{AbstractString, Nothing} = nothing`: The file extension.
* `misrhr_fpath::Union{AbstractString, Nothing} = nothing`: The output path to use instead of the default value.

# Return value(s):
* `misrhr_fspec::Vector{AbstractString}`: A `Vector` of one or nine specification(s) for the MISR-HR product file(s) correponding to the input arguments.

# Algorithm:
* This function assembles the file specification(s) (path and name) of the MISR-HR product file(s) corresponding to the arguments as follows:
- If the keyword argument `misrhr_fpath` exists, that value is used; otherwise a default value is generated by function `make_misrhr_fpath.jl`
- Function `make_misrhr_fname.jl` is called to generate the name of the file.
- These elements are concatenated to create a `Vector` of 1 or 9 file specifications, as appropriate.

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

* This function assumes that MISR-HR product file(s) are organized as described in the MISR-HR Processing System User Manual.
* This function verifies the validity of all arguments except `misr_version` and `misrhr_version`.
* This function does not verify that the path name `misrhr_fpath` component of the output value `misrhr_fspec` exists.
* Function `set_mroots.jl` should be called prior to this function to temporarily define the MISR-HR root directory. To make those definitions permanent, add them to the configuration file `.zshenv` (or equivalent).
* This function always returns a `Vector` of 1 or 9 file name(s).

# Example 1:
```julia
julia> using JMTools

julia> misrhr_fspec = make_misrhr_fspec("BRF", 168, 68050, 110)
1-element Vector{AbstractString}:
 "/Volumes/MISR-HR/P168/B110/BRF/" ⋯ 21 bytes ⋯ "3_P168_O068050_B110_V2.02-0.hdf"

julia> println(misrhr_fspec)
AbstractString["/Volumes/MISR-HR/P168/B110/BRF/MISR_HR_BRF_2012-10-03_P168_O068050_B110_V2.02-0.hdf"]
```

# Example 2:
```julia
julia> using JMTools

julia> misrhr_fspec = make_misrhr_fspec("L1B3", 168, 68050, 110;
               misrhr_subprdct = "refl", misr_camera = "*",
               misrhr_fpath = "~/mypath")
9-element Vector{AbstractString}:
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"
 "~/mypath/MISR_AM1_GRP_TERRAIN_G" ⋯ 19 bytes ⋯ "03_0024.B110_MISRHR_V2.02-0.hdf"

julia> println(misrhr_fspec[5])
 ~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.02-0.hdf
 ```
"""
function make_misrhr_fspec(
    misrhr_prdct::AbstractString,
    misr_path::Integer,
    misr_orbit::Integer,
    misr_block::Integer;
    misrhr_subprdct::Union{AbstractString, Nothing} = nothing,
    misr_camera::Union{AbstractString, Nothing} = nothing,
    misr_version::Union{AbstractString, Nothing} = nothing,
    misrhr_version::Union{AbstractString, Nothing} = nothing,
    rpv_suffix::Union{AbstractString, Nothing} = nothing,
    tip_suffix::Union{AbstractString, Nothing} = nothing,
    ext::Union{AbstractString, Nothing} = nothing,
    misrhr_fpath::Union{AbstractString, Nothing} = nothing
    )::Vector{AbstractString}

    # If `misrhr_fpath` is explicitly provided, use that value; otherwise generate the default value:
    if misrhr_fpath === nothing
        misrhr_fpath = make_misrhr_fpath(misrhr_prdct, misr_path, misr_block;
            misrhr_subprdct = misrhr_subprdct)
    end

    if misrhr_fpath[lastindex(misrhr_fpath)] != '/'
        misrhr_fpath = misrhr_fpath * '/'
    end

    # Generate the name(s) of the data file(s):
    misrhr_fname = make_misrhr_fname(misrhr_prdct, misr_path, misr_orbit, misr_block;
        misr_camera = misr_camera, misr_version = misr_version,
        misrhr_version = misrhr_version, rpv_suffix = rpv_suffix,
        tip_suffix = tip_suffix, ext = ext)

    # Generate the file specification(s) of the desired data file(s):
    nfiles = length(misrhr_fname)
    misrhr_fspec = Vector{AbstractString}(undef, nfiles)

    if nfiles == 1
        misrhr_fspec[1] = misrhr_fpath * misrhr_fname[1]
    else
        for i = 1:nfiles
            misrhr_fspec[i] = misrhr_fpath * misrhr_fname[i]
        end
    end

    return misrhr_fspec

end