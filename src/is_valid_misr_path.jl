"""
    bool, misr_path_string = is_valid_misr_path(misr_path)

# Purpose(s):
* Determine whether the specified `misr_path` is a valid MISR Path number, and return the string version of the MISR Path number prepended with the letter `'P'`.

# Positional argument(s):
* `misr_path::Integer`: The MISR Path number.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misr_path` is a valid MISR Path number or not.
* `misr_path_string::AbstractString`: The string version of the MISR Path number, prepended with the letter `'P'`.

# Algorithm:
This function checks that the value of the positional argument `misr_path` lies within the allowed range (1 to 233), and if so, also returns a string version of that value formatted as `"Pxxx"` where `xxx` is the `misr_path` number padded with `0` to make a 3-digit number.

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

# Note(s): None.

# Example 1:
```julia
julia> using JMTools

julia> bool, misr_path_string = is_valid_misr_path(168)
(true, "P168")
```

# Example 2:
```julia
julia> using JMTools

julia> bool, misr_path_string = is_valid_misr_path(0)
(false, "")
```
"""
function is_valid_misr_path(
    misr_path::Integer
    )::Tuple{Bool, AbstractString}

    if (0 < misr_path) & (misr_path < 234)
        bool = true
        misr_path_string = 'P' * string(misr_path; base = 10, pad = 3)
    else
        bool = false
        misr_path_string = ""
    end

    return bool, misr_path_string

end
