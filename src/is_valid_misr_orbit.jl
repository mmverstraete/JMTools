"""
    bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)

# Purpose:
Determine whether the specified `misr_orbit` is a valid MISR Orbit number, and return the string version of the MISR Path number prepended with the letter "O".

# Required positional argument(s):
* `misr_orbit::Integer`: The MISR Orbit number.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether `misr_orbit` is valid or not.
* `misr_orbit_string::AbstractString`: The string version of the MISR Orbit number.

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

julia> bool, misr_orbit_string = is_valid_misr_orbit(68050)
(true, "O068050")

julia> bool, misr_orbit_string = is_valid_misr_orbit(994)
(false, "")
```
"""
function is_valid_misr_orbit(
    misr_orbit::Integer
    )::Tuple{Bool, AbstractString}

    if (994 < misr_orbit) & (misr_orbit < 200000)
        bool = true
        misr_orbit_string = "O" * string(misr_orbit; base = 10, pad = 6)
    else
        bool = false
        misr_orbit_string = ""
    end

    return bool, misr_orbit_string

end
