"""
    bool = is_valid_ftype(ftype)

# Purpose(s):
* Determine whether the specified `ftype` is a valid file type for the purpose of assembling a filename.

# Positional argument(s):
* `ftype::AbstractString`: The type of file.

# Keyword argument(s): None.

# Return value(s):
* `bool::Boolean`: Whether the argument `ftype` is a recognized file type or not.

# Algorithm:
* This function verifies that the positional argument `ftype` is a valid file type.

# Reference(s):
* The MISR-HR Processing System Manual.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-02-15).

# Notes:
* Additional types of files can be admitted by updating the variable `valid_ftypes` below.

# Example 1:
```julia
julia> using JMTools

julia> bool = is_valid_ftype("Map")
true
```

# Example 2:
```julia
julia> using JMTools

julia> bool = is_valid_ftype("map")
false
```

# Example 3:
```julia
julia> using JMTools

julia> bool = is_valid_ftype("Stats")
true
```
"""
function is_valid_ftype(
    ftype::AbstractString
    )::Bool

    # Set the list of valid file types:
    valid_ftypes = [
        "Caption",
        "Contour",
        "Data",
        "Doc",
        "Log",
        "Map",
        "Plot",
        "Save",
        "Scatt",
        "Stats",
        "Ts"]

    bool = (ftype in valid_ftypes)

    return bool
end
