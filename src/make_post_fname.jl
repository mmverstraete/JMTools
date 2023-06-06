"""
    post_fname = make_post_fname(ftype, prdct, subprdct, qualifier;
        loc = loc, resolution = resolution,
        from_date = from_date, until_date = until_date,
        misr_version = misr_version, misrhr_version = misrhr_version,
        post_version = post_version, ext = ext)

# Purpose(s):
Return the name of the post-processing file corresponding to the arguments.

# Positional argument(s):
* `ftype::AbstractString`: The file type.
* `prdct::AbstractString`: The name of the main product involved.
* `subprdct::AbstractString`: The subproduct acronym.
* `qualifier::AbstractString`: An optional qualifier of the product or of the processing applied.

# Keyword argument(s):
* `loc::Union{NamedTuple, Nothing} = nothing`: The geographical area of interest, as set by function `make_location.jl`.
* `resolution::Union{Integer, Nothing} = nothing`: The product spatial resolution.
* `from_date::Union{Dates.TimeType, Nothing} = nothing`: The date of acquisition of MISR data used to generate the output, or the date of the start of the period of interest.
* `until_date::Union{Dates.TimeType, Nothing} = nothing`: The date of the end of the period of interest.
* `misr_version::Union{AbstractString, Nothing} = nothing`: The MISR software version identifier.
* `misrhr_version::Union{AbstractString, Nothing} = nothing`: The MISR-HR software version identifier.
* `post_version::Union{AbstractString, Nothing} = nothing,`: The post-processing software version identifier.
* `ext::Union{AbstractString, Nothing} = nothing`: The file extension.

# Return value(s):
* `post_fname::AbstractString`: The name of the output file.

# Algorithm:
This function generates a filename based on the information provided by the positional and keyword arguments.

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
* The positional argument `qualifier` is optional: If provided, it can be any valid string, provided it does not contain an underscore character. If not provided, or set to a null string, it is ignored.
* The keyword arguments `misr_path2`, `misr_orbit2` and `misr_block2` are only taken into account if the keyword arguments `misr_path1`, `misr_orbit1`, and `misr_block2` are explicitly provided, respectively.
* A post-processing filename can contain up to three dates:
- If set explicitly, `from_date` indicates the start of the period of interest for the named file. If not set and if `misr_orbit1` is set, the date of acquisition of that first Orbit is used instead.
- If set explicitly, `until_date` indicates the end of the period of interest for the named file. If not set and if `misr_orbit2` is set, the date of acquisition of that last Orbit is used instead.
- This function always includes the current date at the time of execution in this function `make_post_fname.jl`, after the optional dates `from_date` and `until_date`.

# Example 1:
```julia
julia> using JMTools

julia> loc = make_location(;
        misr_path1 = 168, 
        misr_orbit1 = 68050, 
        misr_block1 = 110);

julia> loc.location
"P168+O068050+B110"

julia> post_fname = make_post_fname("Data", "L1RCCMMVR", "cldm", "";
        loc = loc, resolution = 1100, ext = ".nc")
"Data_L1RCCMMVR_cldm_P168+O068050+B110_R1100_2012-10-03+2023-06-06_v3.0.0.nc"
```

# Example 2:
```
julia> using JMTools

julia> loc = make_location(;
        misr_path1 = 168, 
        misr_orbit1 = 60000, misr_orbit2 = 70000,
        misr_block1 = 110, misr_block2 = 115,
        misr_site = "skukuza");

julia> loc.location
"P168+O060000-O070000+B110-B115+SITE_SKUKUZA"

julia> post_fname = make_post_fname("Stats", "TIP", "fapar", "";
               loc = loc, resolution = 275, ext = ".nc")
"Stats_TIP_fapar_P168+O060000-O070000+B110-B115+SITE_SKUKUZA_R275_2011-03-30+2013-02-14+2023-06-06_v3.0.0.nc"
```
"""
function make_post_fname(
    ftype::AbstractString,
    prdct::AbstractString,
    subprdct::AbstractString, 
    qualifier::AbstractString;
    loc::Union{NamedTuple, Nothing} = nothing,
    resolution::Union{Integer, Nothing} = nothing,
    from_date::Union{Dates.TimeType, Nothing} = nothing,
    until_date::Union{Dates.TimeType, Nothing} = nothing,
    misr_version::Union{AbstractString, Nothing} = nothing,
    misrhr_version::Union{AbstractString, Nothing} = nothing,
    post_version::Union{AbstractString, Nothing} = nothing,
    ext::Union{AbstractString, Nothing} = nothing
    )::AbstractString

    # Initialize the return value `post_fname` with the file type:
    if ftype !== nothing
        bool = is_valid_ftype(ftype)
        if bool == true
            post_fname = ftype
        else
            error("make_post_fname: Positional argument `ftype` is unrecognized.")
        end
    else
        error("make_post_fname: Positional argument `ftype` is required.")
    end

    # Add the MISR, MISR-HR or post-processing product name:
    if prdct !== nothing
        bool1, prdct_name, prdct_full_name, prdct_esdt = is_valid_misr_prdct(prdct)
        bool2, prdct_full_name = is_valid_misrhr_prdct(prdct)
#        bool3, prdct_full_name = is_valid_post_prdct(prdct)
        if (bool1 == true) | (bool2 == true) # | (bool3 == true)
            post_fname = post_fname * '_' * prdct
        else
            error("make_post_fname: Positional argument `prdct` is unrecognized.")
        end
    else
        error("make_post_fname: Positional argument `prdct` is required.")
    end

    # Add the MISR, MISR-HR or post-processing subproduct name:
    if subprdct !== nothing
        bool1, subprdct_name = is_valid_misr_subprdct(prdct, subprdct)
        bool2, subprdct_name = is_valid_misrhr_subprdct(prdct, subprdct)
#        bool3, subprdct_name = is_valid_post_subprdct(prdct, subprdct)
        if (bool1 == true) | (bool2 == true) # | (bool3 == true)
            post_fname = post_fname * '_' * subprdct
        else
            error("make_post_fname: Positional argument `subprdct` is not a valid subproduct of `prdct`.")
        end
    else
        error("make_post_fname: Positional argument `subprdct` is required.")
    end

    # Add the optional subproduct qualifier, if it does not contain an underscore character:
    if (qualifier !== nothing) & (qualifier !== "")
        no_ = findfirst(x -> (x == '_'), qualifier)
        if no_ !== nothing
            error("make_post_fname: Positional argument `qualifier` cannot contain underscore characters.")
        end
        post_fname = post_fname * '_' * qualifier
    end

    # Add the location information:
    post_fname = post_fname * '_' * loc.location

    # Format the spatial resolution and add it to the filename:
    if resolution !== nothing
        resolution_str = "R" * string(resolution; base = 10)
        post_fname = post_fname * '_' * resolution_str
    end

    # Add the MISR or MISR-HR timing information:
    dt3 = Dates.format(Dates.today(), "yyyy-mm-dd")
    if from_date !== nothing
        dt1 = Dates.format(from_date, "yyyy-mm-dd")
        post_fname = post_fname * '_' * dt1
        if until_date !== nothing
            dt2 = Dates.format(until_date, "yyyy-mm-dd")
            post_fname = post_fname * '+' * dt2 * '+' * dt3
        else
            post_fname = post_fname * '+' * dt3
        end
    elseif loc.misr_orbit1 !== nothing
        bool, misr_orbit_string = is_valid_misr_orbit(loc.misr_orbit1)
        if bool
            orbit_date, orbit_date_string = orbit2date(loc.misr_orbit1; fmt = "")
            post_fname = post_fname * '_' * orbit_date_string
        end
        if loc.misr_orbit2 !== nothing
            bool, misr_orbit_string = is_valid_misr_orbit(loc.misr_orbit2)
            if bool
                orbit_date, orbit_date_string = orbit2date(loc.misr_orbit2; fmt = "")
                post_fname = post_fname * '+' * orbit_date_string * '+' * dt3
            else
                post_fname = post_fname * '+'  * dt3
            end
        else
            post_fname = post_fname * '+'  * dt3
        end
    end
    
    # Add the MISR and optionally the MISR-HR version information:
    if misr_version !== nothing
        post_fname = post_fname * '_' * misr_version
        if misrhr_version !== nothing
            post_fname = post_fname * '+' * misrhr_version
        end
    else
        misr_version = set_current_prdct_version(prdct)
        post_fname = post_fname * '_' * misr_version
        if misrhr_version !== nothing
            post_fname = post_fname * '+' * misrhr_version
        end
    end

    # Add the file extension:
    if ext !== nothing
        post_fname = post_fname * ext
    else
        if ((ftype == "Caption") |
            (ftype == "Log"))
            post_fname = post_fname * ".txt"
        elseif (ftype == "Doc")
            post_fname = post_fname * ".pdf"
        elseif ftype == "Data"
            post_fname = post_fname * ".nc"
        elseif ((ftype == "Contour") |
            (ftype == "Map") |
            (ftype == "Plot") |
            (ftype == "Scatt") |
            (ftype == "Ts"))
            post_fname = post_fname * ".png"
        end
    end

    return post_fname

end
