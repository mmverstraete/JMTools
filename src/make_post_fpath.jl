"""
    post_fpath = make_post_fpath(; user = user, project = project,
        loc = loc, call_f = call_f, prdct = prdct, ftype = ftype)

# Purpose(s):
* Generate the full name `post_fpath` of the directory containing the post-processing file(s) for the specified `user` and `project`, for the geographical area `loc`, in response to a request from function `call_f`, for the main product `prdct`, and for a file of type `ftype`.

# Positional argument(s): None.

# Keyword argument(s):
* `user::Union{AbstractString, Nothing} = nothing`: The user name.
* `project::Union{AbstractString, Nothing} = nothing`: The project name.
* `loc::Union{NamedTuple, Nothing} = nothing`: The geographical area of interest, as set by function `make_location.jl`.
* `call_f::Union{AbstractString, Nothing} = nothing`: The name of the highest-level function requesting the use or creation of this directory.
* `prdct::Union{AbstractString, Nothing} = nothing`: The name of the main product involved.
* `ftype::Union{AbstractString, Nothing} = nothing`: The file type involved.

# Return value(s):
* `post_fpath::AbstractString`: The full name of the directory containing the post-processing file(s) for the specified user, project, loc, calling function, product and file type.

# Algorithm:
* This function initializes the output value `post_fpath` with the root directory `MROOT_SCRAP`, if it is defined, and with the root directory `MROOT_POST` otherwise; it then appends a relative directory name based on the keyword arguments provided.

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

# Notes:
* This function generates an absolute directory name but does not create it.

# Example 1:
```julia
julia> using JMTools

julia> set_mroots("Unset");

julia> post_fpath = make_post_fpath()
"~/U=Dev/P=Test/NOLOC/make_post_fpath/all_prdcts/all_ftypes/"
```

# Example 2:
```
julia> using JMTools

julia> set_mroots("Reset");

julia> loc = make_location(misr_path1 = 168, misr_orbit1 = 68050, misr_block1 = 110);

julia> loc.location
"P168+O068050+B110"

julia> post_fpath = make_post_fpath(; loc = loc, prdct = "L1RCCMMVR", ftype = "Map")
"/Users/michel/Projects/MISR/Scrap/U=Dev/P=Test/P168+O068050+B110/make_post_fpath/L1RCCMMVR/Map/"
```

# Example 3:
```
julia> using JMTools

julia> set_mroots("Reset");

julia> loc = make_location(misr_path1 = 168, misr_path2 = 170,
        misr_orbit1 = 68000, misr_orbit2 = 72000,
        misr_block1 = 110, misr_block2 = 112,
        misr_site = "Skukuza");

julia> loc.location
"P168-P170+O068000-O072000+B110-B112+SITE_SKUKUZA"

julia> post_fpath = make_post_fpath(; user = "John", project = "Test", loc = loc,
               prdct = "L1RCCMMVR", ftype = "Map")
"/Users/michel/Projects/MISR/Scrap/U=John/P=Test/P168-P170+O068000-O072000+B110-B112+SITE_SKUKUZA/make_post_fpath/L1RCCMMVR/Map/"
```
"""
function make_post_fpath(;
    user::Union{AbstractString, Nothing} = nothing,
    project::Union{AbstractString, Nothing} = nothing,
    loc::Union{NamedTuple, Nothing} = nothing,
    call_f::Union{AbstractString, Nothing} = nothing,
    prdct::Union{AbstractString, Nothing} = nothing,
    ftype::Union{AbstractString, Nothing} = nothing
    )::AbstractString

    # Define the path separator appropriate for the underlying operating system:
    path_sep = Base.Filesystem.path_separator

    # Initialize the output value `post_fpath` with the scrap root path (if it is defined) or with the post-processing root path (if it is defined), and with the user's home directory (otherwise):
    if "MROOT_SCRAP" in keys(ENV)
        post_fpath = ENV["MROOT_SCRAP"]
    elseif "MROOT_POST" in keys(ENV)
        post_fpath = ENV["MROOT_POST"]
    else
        post_fpath = "~" * path_sep
    end

    if string(post_fpath[lastindex(post_fpath)]) != path_sep
        post_fpath = post_fpath * path_sep
    end

    # Add the `user` subdirectory:
    if (user === nothing) | (user === "")
        post_fpath = post_fpath * "U=Dev" * path_sep
    else
        post_fpath = post_fpath * "U=" * user * path_sep
    end

    # Add the project subdirectory:
    if (project === nothing) | (project === "")
        post_fpath = post_fpath * "P=Test" * path_sep
    else
        post_fpath = post_fpath * "P=" * project * path_sep
    end

    # Add the location subdirectory:
    if loc === nothing
        post_fpath = post_fpath * "NOLOC" * path_sep
    else
        if loc.location == ""
            post_fpath = post_fpath * "NOLOC" * path_sep
        else
            post_fpath = post_fpath * loc.location * path_sep
        end
    end

    # Add the calling function subdirectory:
    if (call_f === nothing) | (call_f === "")
        post_fpath = post_fpath * "make_post_fpath" * path_sep
    else
        post_fpath = post_fpath * call_f * path_sep
    end

    # Add the product name subdirectory:
    if (prdct === nothing) | (prdct === "")
        post_fpath = post_fpath * "all_prdcts" * path_sep
    else
        post_fpath = post_fpath * prdct * path_sep
    end

    # Add the file type subdirectory:
    if (ftype === nothing) | (ftype === "")
        post_fpath = post_fpath * "all_ftypes" * path_sep
    else
        post_fpath = post_fpath * ftype * path_sep
    end

    return post_fpath

end
