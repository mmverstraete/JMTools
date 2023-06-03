"""
    bool, misr_block_string = is_valid_misr_block(misr_block)

# Purpose(s):
* Determine whether the specified `misr_block` is a valid MISR Block number, and return the string version of the MISR Block number prepended with the letter 'B'.

# Positional argument(s):
* `misr_block::Integer`: The MISR Block number.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misr_block` is a valid MISR Block number or not.
* `misr_block_string::AbstractString`: The string version of the MISR Block number, prepended with the letter `'B'`.

# Algorithm:
This function checks that the value of the positional argument `misr_block` lies within the allowed range (1 to 180), and if so, also returns a string version of that value formatted as `"Bxxx"` where `xxx` is the `misr_block` number padded with `0` to make a 3-digit number.

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

julia> bool, misr_block_string = is_valid_misr_block(110)
(true, "B110")
```

# Example 2:
```
julia> using JMTools

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
