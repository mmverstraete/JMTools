"""
    bool = is_valid_misrhr_prdct(misrhr_prdct)

# Purpose:
Determine whether the specified `misrhr_prdct` is a valid MISR-HR product acronym.

# Required positional argument(s):
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.

# Optional keyword(s): None.

# Returned value(s):
* `bool::Bool`: Whether `misrhr_prdct` is valid or not.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s):
* This function currently recognizes the MISR-HR product acronyms defined below; additional acronyms can be added as needed.

# Example(s):
```julia
julia> using JMTools

julia> bool = is_valid_misrhr_prdct("TIP")
true

julia> bool = is_valid_misrhr_prdct("l1B3")
false
```
"""
function is_valid_misrhr_prdct(
    misrhr_prdct::AbstractString
    )::Bool

    # Set the list of valid products:
    valid_misrhr_prdct = [
        "L1B3",
        "BRF",
        "RPV",
        "TIP"]

    bool = (misrhr_prdct in valid_misrhr_prdct)

    return bool

end
