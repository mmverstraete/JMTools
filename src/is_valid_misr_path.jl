"""
    bool, misr_path_string = is_valid_misr_path(misr_path)

# Purpose:
Determine whether the specified `misr_path` is a valid MISR Path number, and return the string version of the MISR Path number prepended with the letter "P".

# Required positional argument(s):
* `misr_path::Integer`: The MISR path number.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether `misr_path` is valid or not.
* `misr_path_string::AbstractString`: The string version of the MISR Path number.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s): N/A.

# Example(s):
```julia
julia> using JMTools

julia> bool, misr_path_string = is_valid_misr_path(168)
(true, "P168")

julia> bool, misr_path_string = is_valid_misr_path(0)
(false, "")
```
"""
function is_valid_misr_path(
    misr_path::Integer
    )::Tuple{Bool, AbstractString}

    if (0 < misr_path) & (misr_path < 234)
        bool = true
        misr_path_string = "P" * string(misr_path; base = 10, pad = 3)
    else
        bool = false
        misr_path_string = ""
    end

    return bool, misr_path_string

end
