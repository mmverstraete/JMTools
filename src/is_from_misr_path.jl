"""
    bool = is_from_misr_path(misr_path, misr_orbit)

# Purpose:
Check whether the given `misr_orbit` belongs to the specified `misr_path`.

# Required positional argument(s):
* `misr_path::Integer`: The MISR Path number.
* `misr_orbit::Integer`: The MISR Orbit number.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether the given `misr_orbit` belongs to the specified `misr_path`.

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

julia> using Test

julia> misr_path = 168
168

julia> misr_orbit = 68050
68050

julia> bool = is_from_misr_path(misr_path, misr_orbit)
true
```
"""
function is_from_misr_path(
    misr_path::Integer,
    misr_orbit::Integer
    )::Bool

    bool, misr_path_string = is_valid_misr_path(misr_path)
    if bool != true
        error("is_from_misr_path: Invalid input argument misr_path.")
    end
    bool, misr_orbit_string = is_valid_misr_orbit(misr_orbit)
    if bool != true
        error("is_from_misr_path: Invalid input argument misr_orbit.")
    end
    true_path = JMtk15.jMtkOrbitToPath(misr_orbit)
    if true_path == misr_path
        bool = true
    else
        bool = false
    end

    return bool

end