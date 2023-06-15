"""
    mroot_post, user, project, location, call_f, prdct, ftype = split_post_fpath(post_fpath)

# Purpose(s):
* Split the full filesystem path name `post_fpath` of a directory containing post-processing product file(s) and return the user and project names, the name of the main function generating a product in that directory, and the file type.

# Positional argument(s):
* `post_fpath::AbstractString`: The filesystem path name of a directory containing post-processing product file(s).

# Keyword argument(s): None.

# Return value(s):
* `mroot_post::AbstractString`: The root directory for post-processing product files.
* `user::AbstractString`: The user name.
* `project::AbstractString`: The project name.
* `location::AbstractString`: The `string` describing the geographical area covered by a post-processing product.
* `call_f::AbstractString`: The name of the highest-level function that requested the use or creation of this directory.
* `prdct::AbstractString`: The name of the main product involved.
* `ftype::AbstractString`: The file type involved.

# Algorithm:
* This function splits the absolute filesystem path name of a directory containing post-processing product files and returns the post-processing root directory `mroot_post`, the `user` and `project` names, the geographical information `location`, the name of the highest-level function that used that post-processing path, the post-processing product and the file type.

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
* See the function `split_location.jl` to split the elements that determine the `location` information.
* This function assumes that MISR-HR product file(s) are organized as described in the MISR-HR Processing System User Manual.
* This function does not verify that the input argument `post_fpath` exists, or that the output values are valid, although an error condition may be raised if the syntax of `post_fpath` cannot be interpreted.

# Example 1:
```julia
julia> using JMTools

julia> mroot_post, user, project, location, call_f, prdct, ftype =
           split_post_fpath("~/U=Dev/P=Test/NOLOC/make_post_fpath/all_prdcts/all_ftypes/")
("~/", "Dev", "Test", "NOLOC", "make_post_fpath", "all_prdcts", "all_ftypes")
```

# Example 2:
```julia
julia> using JMTools

julia> mroot_post, user, project, location, call_f, prdct, ftype =
        split_post_fpath("/Users/michel/Projects/MISR/Scrap/U=Dev/P=Test/P168+O068050+B110/make_post_fpath/L1RCCMMVR/Map/")
("/Users/michel/Projects/MISR/Scrap/", "Dev", "Test", "P168+O068050+B110", "make_post_fpath", "L1RCCMMVR", "Map")
```

# Example 3:
```julia
julia> using JMTools

julia> mroot_post, user, project, location, call_f, prdct, ftype =
        split_post_fpath("/Users/michel/Projects/MISR/Scrap/U=John/P=Test/P168-P170+O068000-O072000+B110-B112+SITE_SKUKUZA/make_post_fpath/L1RCCMMVR/Map/")
("/Users/michel/Projects/MISR/Scrap/", "John", "Test", "P168-P170+O068000-O072000+B110-B112+SITE_SKUKUZA", "make_post_fpath", "L1RCCMMVR", "Map")
```
"""
function split_post_fpath(
    post_fpath::AbstractString
    )::Tuple{AbstractString, AbstractString, AbstractString, AbstractString, AbstractString, AbstractString, AbstractString}

    # Initialize the output variables to null values:
    mroot_post = ""
    user = ""
    project = ""
    location = ""
    call_f = ""
    prdct = ""
    ftype = ""

    # Look for the pattern "U=" as the start of the filesystem path (relative to the root path) and split the post-processing root directory:
    idx = findfirst("U=", post_fpath)
    if idx[1] > 1
        mroot_post = post_fpath[1:idx[1] - 1]
        relpath_post = post_fpath[idx[1]:end]
        if string(last(relpath_post)) == "/"
            relpath_post = chop(relpath_post, tail = 1)
        end

    # Split the relative path `relpath_post` on the character "/" and extract the user name:
        elems = split(relpath_post, "/")
        if length(elems) != 6
            error("split_post_fpath: The input argument post_fpath is not a properly formatted directory path for post-processing product files.")
        end
        user = chop(elems[1], head = 2, tail = 0)

    # Extract the project name:
        project = chop(elems[2], head = 2, tail = 0)

    # Extract the location information:
        location = elems[3]

    # Extract the name of the calling function:
        call_f = elems[4]

    # Extract the product name:
        prdct = elems[5]

    # Extract the file type:
        ftype = elems[6]
    else
        mroot_post = post_fpath
    end

    return mroot_post, user, project, location, call_f, prdct, ftype

end
