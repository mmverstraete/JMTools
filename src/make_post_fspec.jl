"""
    post_fspec = make_post_fspec(ftype, prdct, subprdct, qualifier;
        user = user, project = project,
        loc = loc, resolution = resolution,
        from_date = from_date, until_date = until_date,
        misr_version = misr_version, misrhr_version = misrhr_version,
        ext = ext, call_f = call_f, out_folder = out_folder)

# Purpose(s):
Return the specification (path and name) of the output file corresponding to the specified arguments.

# Positional argument(s):
* `ftype::AbstractString`: The file type.
* `prdct::Union{AbstractString, Nothing} = nothing`: The name of the main product involved.
* `subprdct::AbstractString`: The subproduct acronym.
* `qualifier::AbstractString = ""`: An optional qualifier of the product or of the processing applied.

# Keyword argument(s):
* `user::Union{AbstractString, Nothing} = nothing`: User name.
* `project::Union{AbstractString, Nothing} = nothing`: Project name.
* `loc::Union{NamedTuple, Nothing} = nothing`: The geographical area of interest, as set by function `make_location.jl`.
* `resolution::Union{Integer, Nothing} = nothing`: The MISR spatial resolution.
* `from_date::Union{Dates.TimeType, Nothing} = nothing`: The The first (or only) date of acquisition of MISR data used to generate the output.
* `until_date::Union{Dates.TimeType, Nothing} = nothing`: The last date of acquisition of MISR data used to generate the output.
* `misr_version::Union{AbstractString, Nothing} = nothing`: The MISR product version identifier.
* `misrhr_version::Union{AbstractString, Nothing} = nothing`: The MISR-HR product version identifier.
* `ext::Union{AbstractString, Nothing} = nothing`: The file extension.
* `call_f::Union{AbstractString, Nothing} = nothing`: The name of the highest-level function requesting the use or creation of this directory. (Default value: `make_post_fpath`).

# Return value(s):
* `post_fspec::AbstractString`: The specification of the output file.

# Algorithm:
This function relies on function `make_post_fpath.jl` to set the directory to contain the output file, if it is not specified in the keyword argument `out_folder`, and on function `make_post_fname.jl` to set the name of the file matching the arguments.

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
* This function assumes that post-processing file(s) are organized as described in the MISR-HR Processing System User Manual.
* This function verifies the validity of all arguments except `misr_version` and `misrhr_version`.
* This function does not verify that the path name `post_fpath` component of the output value `post_fspec` exists, nor does it create it.
* Function `set_mroots.jl` should be called prior to this function to temporarily define the `"MROOT_POST"` root directory. To make those definitions permanent, add them to the configuration file `.zshenv` (or equivalent).

# Example 1:
```julia
julia> using JMTools

julia> set_mroots("Unset");

julia> loc = make_location(;
        misr_path1 = 168, misr_path2 = 170,
        misr_orbit1 = 68000, misr_orbit2 = 70000,
        misr_block1 = 100, misr_block2 = 110);

julia> loc.location
"P168-P170+O068000-O070000+B100-B110"

julia> post_fspec = make_post_fspec("Map", "L1RTGM", "radrd", "";
        user = "MMV", project = "Explore",
        loc = loc, call_f = "make_post_fspec")
"~/U=MMV/P=Explore/P168-P170+O068000-O070000+B100-B110/make_post_fspec/L1RTGM/Map/Map_L1RTGM_radrd_P168-P170+O068000-O070000+B100-B110_2012-09-29+2013-02-14+2023-06-06_F03_0024.png"
```

# Example 2:
```julia
julia> using JMTools

julia> set_mroots("Reset");

julia> loc = make_location(;
        misr_path1 = 192, misr_path2 = 194,
        misr_orbit1 = 80000, misr_orbit2 = 82000,
        misr_block1 = 56, misr_block2 = 58);

julia> loc.location
"P192-P194+O080000-O082000+B056-B058"

julia> post_fspec = make_post_fspec("Map", "L2LAND", "Bidirectional_Reflectance_Factor";
        user = "MMV", project = "Explore",
        loc = loc, resolution = 1100)
"/Users/michel/Projects/MISR/Scrap/U=MMV/P=Explore/P192-P194+O080000-O082000+B056-B058/make_post_fpath/L2LAND/Map/Map_L2LAND_Bidirectional_Reflectance_Factor_P192-P194+O080000-O082000+B056-B058_R1100_2015-01-01+2015-05-19+2023-06-06_F08_0023.png"
```
"""
function make_post_fspec(
    ftype::AbstractString,
    prdct::AbstractString,
    subprdct::AbstractString,
    qualifier::AbstractString = "";
    user::Union{AbstractString, Nothing} = nothing,
    project::Union{AbstractString, Nothing} = nothing,
    loc::Union{NamedTuple, Nothing} = nothing,
    resolution::Union{Integer, Nothing} = nothing,
    from_date::Union{Dates.TimeType, Nothing} = nothing,
    until_date::Union{Dates.TimeType, Nothing} = nothing,
    misr_version::Union{AbstractString, Nothing} = nothing,
    misrhr_version::Union{AbstractString, Nothing} = nothing,
    ext::Union{AbstractString, Nothing} = nothing,
    call_f::Union{AbstractString, Nothing} = nothing,
    out_folder::Union{AbstractString, Nothing} = nothing
    )::AbstractString

    # Set the output path:
    if (out_folder === nothing) | (out_folder === "")
        post_fpath = make_post_fpath(; user = user, project = project,
            loc = loc, call_f = call_f,
            prdct = prdct, ftype = ftype)
    else
        post_fpath = out_folder
    end

    # Set the filename:
    post_fname = make_post_fname(ftype, prdct, subprdct, qualifier;
        loc = loc, resolution = resolution,
        from_date = from_date, until_date = until_date,
        misr_version = misr_version, misrhr_version = misrhr_version,
        ext = ext)

    # Assemble the file specification:
    post_fspec = post_fpath * post_fname

    return post_fspec

end
