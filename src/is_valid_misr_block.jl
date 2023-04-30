"""
    bool, misr_block_string = is_valid_misr_block(misr_block)

# Purpose:
Determine whether the specified `misr_block` is a valid MISR Block number, and return the string version of the MISR Path number prepended with the letter "B".

# Required positional argument(s):
* `misr_block::Integer`: The MISR Block number.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether `misr_block` is valid or not.
* `misr_block_string::AbstractString`: The string version of the MISR Block number.

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

julia> bool, misr_block_string = is_valid_misr_block(110)
(true, "B110")

julia> bool, misr_block_string = is_valid_misr_block(190)
(false, "")
```
"""
function is_valid_misr_block(
    misr_block::Integer
    )::Tuple{Bool, AbstractString}

    if (0 < misr_block) & (misr_block < 181)
        bool = true
        misr_block_string = "B" * string(misr_block; base = 10, pad = 3)
    else
        bool = false
        misr_block_string = ""
    end

    return bool, misr_block_string

end
