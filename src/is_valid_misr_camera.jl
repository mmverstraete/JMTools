"""
    bool = is_valid_misr_camera(misr_camera)

# Purpose:
Determine whether the specified `misr_camera` is a valid MISR camera name.

# Required positional argument(s):
* `misr_camera::AbstractString`: The MISR camera name.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether `misr_camera` is valid or not.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* In some contexts, the MISR Camera field can be specified as "*" to represent the set of 9 similar files, one for each of the 9 cameras, but in that case the eventual presence of this specification must be detected before evaluating the validity of the camera name.

# Example(s):
```julia
julia> using JMTools

julia> bool = is_valid_misr_camera("AA")
true

julia> bool = is_valid_misr_camera("df")
false
```
"""
function is_valid_misr_camera(
    misr_camera::AbstractString
    )::Bool

    # Set the list of valid camera names:
    valid_misr_camera = [
        "DF",
        "CF",
        "BF",
        "AF",
        "AN",
        "AA",
        "BA",
        "CA", 
        "DA"]

    bool = (misr_camera in valid_misr_camera)

    return bool

end
