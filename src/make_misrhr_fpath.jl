"""
    misrhr_fpath = make_misrhr_fpath(misrhr_prdct, misr_path, misr_block;
        misrhr_subprdct = misrhr_subprdct)

# Purpose(s):
* Generate the full name `misrhr_fpath` of the directory containing the MISR-HR product file(s) for `misrhr_prdct` and `misrhr_subprdct` along MISR Path number `misr_path` and for MISR Block number `misr_block`.

# Positional argument(s):
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.
* `misr_path::Integer`: The MISR Path number.
* `misr_block::Integer`: The MISR Block number.

# Keyword argument(s):
* `misrhr_subprdct::Union{AbstractString, Nothing} = nothing`: The MISR-HR subproduct acronym.

# Return value(s):
* `misrhr_fpath::AbstractString`: The full name of the directory containing MISR-HR data file(s) for the specified product, Path and Block numbers.

# Algorithm:
* This function generates the full path name of the directory containing the MISR-HR products `misrhr_prdct` and `misrhr_subprdct` for Path `misr_path` and Block `misr_block` by concatenating the MISR root directory set by function `set_mroots.jl` in environment variable `MROOT_MISRHR` and the appropriate directory relative to that root.

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
* This function does not verify that the output path name `misrhr_fpath` exists.
* Function `set_mroots.jl` should be called prior to this function to temporarily define the MISR-HR root directory. To make those definitions permanent, add them to the configuration file `.zshenv` (or equivalent).
* The directory name suggested by this function can be overridden by specifying an alternate value in function `make_misrhr_fspec.jl`.

# Example 1:
```julia
julia> using JMTools

julia> set_mroots("Unset");

julia> misrhr_fpath = make_misrhr_fpath("L1B3", 168, 110)
"~/P168/B110/L1B3/"
```

# Example 2:
```julia
julia> using JMTools

julia> set_mroots("Reset");

julia> misrhr_fpath = make_misrhr_fpath("L1B3", 168, 110)
"/Volumes/MISR-HR/P168/B110/L1B3/"
```

# Example 3:
```julia
julia> using JMTools

julia> set_mroots("Reset");

julia> misrhr_fpath = make_misrhr_fpath("TIP", 168, 110; misrhr_subprdct = "efflai")
"/Volumes/MISR-HR/P168/B110/TIP/efflai/"
```
"""
function make_misrhr_fpath(
    misrhr_prdct::AbstractString,
    misr_path::Integer,
    misr_block::Integer;
    misrhr_subprdct::Union{AbstractString, Nothing} = nothing
    )::AbstractString

    # Check the validity of the positional arguments and set the string versions of the MISR Path and Block numbers:
    bool, prdct_full_name = is_valid_misrhr_prdct(misrhr_prdct)
    if bool == false
        error("make_misrhr_fpath: Invalid MISR-HR product acronym.")
    end
    bool, misr_path_string = is_valid_misr_path(misr_path)
    if bool == false
        error("make_misrhr_fpath: Invalid MISR Path number.")
    end
    bool, misr_block_string = is_valid_misr_block(misr_block)
    if bool == false
        error("make_misrhr_fpath: Invalid MISR Block number.")
    end
    if (misrhr_subprdct !== nothing) & (misrhr_subprdct != "")
        bool, subprdct_name = is_valid_misrhr_subprdct(misrhr_prdct, misrhr_subprdct)
        if bool == false
            error("make_misrhr_fpath: Invalid MISR subproduct acronym.")
        end
    end

    # Initialize the output value `misrhr_fpath` with the MISR-HR root path (if it is defined) and with the user's home directory (otherwise):
    if "MROOT_MISRHR" in keys(ENV)
        misrhr_fpath = ENV["MROOT_MISRHR"]
    else
        misrhr_fpath = "~/"
    end

    if misrhr_fpath[lastindex(misrhr_fpath)] != '/'
        misrhr_fpath = misrhr_fpath * '/'
    end

    # Add the name of the folder containing the data file(s) for the specified MISR product acronym and Path:
    misrhr_fpath = misrhr_fpath * misr_path_string * '/' *
        misr_block_string * '/' * misrhr_prdct * '/'

    # If `misrhr_prdct` is provided, assign a sudirectory to that subproduct:
    if (misrhr_subprdct !== nothing) & (misrhr_subprdct != "")
        misrhr_fpath = misrhr_fpath * misrhr_subprdct * '/'
    end

    return misrhr_fpath

end
