"""
    loc = make_location(;
        misr_path1 = misr_path1, misr_path2 = misr_path2,
        misr_orbit1 = misr_orbit1, misr_orbit2 = misr_orbit2,
        misr_block1 = misr_block1, misr_block2 = misr_block2,
        misr_site = misr_site)

# Purpose(s):
* Set a `String` describing the geographical area covered by a MISR or MISR-HR deliverable product on the basis of the input keyword arguments, in a format suitable for use in file names.

# Positional argument(s): None.

# Keyword argument(s):
* `misr_path1::Union{Integer, Nothing} = nothing`: The first (or only) MISR Path number.
* `misr_path2::Union{Integer, Nothing} = nothing`: The last MISR Path number.
* `misr_orbit1::Union{Integer, Nothing} = nothing`: The first (or only) MISR Orbit number.
* `misr_orbit2::Union{Integer, Nothing} = nothing`: The last MISR Orbit number.
* `misr_block1::Union{Integer, Nothing} = nothing`: The first (or only) MISR Block number.
* `misr_block2::Union{Integer, Nothing} = nothing`: The last MISR Block number.
* `misr_site::Union{AbstractString, Nothing} = nothing`: The MISR Local Mode Site name.

# Return value(s):
* `loc::NamedTuple{(
    :misr_path1, :misr_path1_string,
    :misr_path2, :misr_path2_string,
    :misr_orbit1, :misr_orbit1_string,
    :misr_orbit2, :misr_orbit2_string,
    :misr_block1, :misr_block1_string,
    :misr_block2, :misr_block2_string,
    :misr_site, :misr_site_label,
    :location),
    Tuple{Integer, AbstractString,
        Integer, AbstractString,
        Integer, AbstractString,
        Integer, AbstractString,
        Integer, AbstractString,
        Integer, AbstractString,
        AbstractString, AbstractString,
        AbstractString}}`:
    Variables describing the geographical area covered by a MISR or MISR-HR deliverable product.

# Algorithm:
* This function generates the output NamedTuple `loc` containing the following information:
- the specified or default numerical values of the keyword arguments `misr_path1`, `misr_path2`, `misr_orbit1`, `misr_orbit2`, `misr_block1`, `misr_block2`;
- the corresponding string expressions of those 6 keywords;
- the specified or default string value of the keyword argument `misr_site`;
- the corresponding string expression `misr_site_label`; and
- the assembled string `location` concatenating these elements with the following syntax:

`location = [P1[-P2]][+O1[-O2]][+B1[-B2]][+S] | [NOLOC]`

subject to the following rules and constraints:

- `P1 = "P" * misr_path1`, if `misr_path1` is provided.
- `P2 = "P" * misr_path2`, if `misr_path1` and `misr_path2` are both provided.
- `O1 = "O" * misr_orbit1`, if `misr_orbit1` is provided.
- `O2 = "O" * misr_orbit2`, if `misr_orbit1` and `misr_orbit2` are provided.
- `B1 = "B" * misr_block1`, if `misr_block1` is provided.
- `B2 = "B" * misr_block2`, if `misr_block1` and `misr_block2` are both provided.
- `S = misr_site`, if `misr_site` is provided.

where

- Keywords that are not provided by the calling function are ignored.
- A keyword `X2` is ignored if `X1` is not also provided (both indicate a range for the corresponding keyword).
- If none of the MISR-specific keywords are provided, the output variable is set to `"NOLOC"`.

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

# Notes: None.

# Example 1:
```julia
julia> using JMTools

julia> loc = make_location()
NamedTuple{(:misr_path1, :misr_path1_string, :misr_path2, :misr_path2_string, :misr_orbit1, :misr_orbit1_string, :misr_orbit2, :misr_orbit2_string, :misr_block1, :misr_block1_string, :misr_block2, :misr_block2_string, :misr_site, :misr_site_label, :location), Tuple{Integer, AbstractString, Integer, AbstractString, Integer, AbstractString, Integer, AbstractString, Integer, AbstractString, Integer, AbstractString, AbstractString, AbstractString, AbstractString}}((0, "", 0, "", 0, "", 0, "", 0, "", 0, "", "", "", "NOLOC"))
```

# Example 2:
```julia
julia> using JMTools

julia> loc = make_location(; misr_path1 = 168);

julia> loc.location
"P168"
```

# Example 3:
```julia
julia> using JMTools

julia> loc = make_location(; misr_path1 = 168, misr_orbit1 = 68050, misr_block1 = 110);

julia> loc.location
"P168+O068050+B110"
```

# Example 4:
```julia
julia> using JMTools

julia> loc = make_location(; misr_path1 = 168, misr_path2 = 170,
           misr_orbit1 = 68050, misr_orbit2 = 72000,
           misr_site = "skukuza");

julia> loc.location
"P168-P170+O068050-O072000+SITE_SKUKUZA"
```
"""
function make_location(;
    misr_path1::Union{Integer, Nothing} = nothing,
    misr_path2::Union{Integer, Nothing} = nothing,
    misr_orbit1::Union{Integer, Nothing} = nothing,
    misr_orbit2::Union{Integer, Nothing} = nothing,
    misr_block1::Union{Integer, Nothing} = nothing,
    misr_block2::Union{Integer, Nothing} = nothing,
    misr_site::Union{AbstractString, Nothing} = nothing
    )::NamedTuple{(
        :misr_path1, :misr_path1_string,
        :misr_path2, :misr_path2_string,
        :misr_orbit1, :misr_orbit1_string,
        :misr_orbit2, :misr_orbit2_string,
        :misr_block1, :misr_block1_string,
        :misr_block2, :misr_block2_string,
        :misr_site, :misr_site_label,
        :location),
        Tuple{Integer, AbstractString,
            Integer, AbstractString,
            Integer, AbstractString,
            Integer, AbstractString,
            Integer, AbstractString,
            Integer, AbstractString,
            AbstractString, AbstractString,
            AbstractString}}

    # Initialize the output variable location:
    location = ""

    # Assemble the location string and set the output Tuple elements:
    if misr_path1 !== nothing
        bool, misr_path1_string = is_valid_misr_path(misr_path1)
        if bool != true
            error("make_location: Argument misr_path1 is invalid.")
        end
        location = misr_path1_string
        if misr_path2 !== nothing
            bool, misr_path2_string = is_valid_misr_path(misr_path2)
            if bool != true
                error("make_location: Argument misr_path2 is invalid.")
            end
            location = location * '-' * misr_path2_string
        else
            misr_path2 = 0
            misr_path2_string = ""
        end
    else
        misr_path1 = 0
        misr_path1_string = ""
        misr_path2 = 0
        misr_path2_string = ""
    end

    if misr_orbit1 !== nothing
        bool, misr_orbit1_string = is_valid_misr_orbit(misr_orbit1)
        if bool != true
            error("make_location: Argument misr_orbit1 is invalid.")
        end
        location = location * '+' * misr_orbit1_string
        if misr_orbit2 !== nothing
            bool, misr_orbit2_string = is_valid_misr_orbit(misr_orbit2)
            if bool != true
                error("make_location: Argument misr_orbit2 is invalid.")
            end
            location = location * '-' * misr_orbit2_string
        else
            misr_orbit2 = 0
            misr_orbit2_string = ""
        end
    else
        misr_orbit1 = 0
        misr_orbit1_string = ""
        misr_orbit2 = 0
        misr_orbit2_string = ""
    end
    
    if misr_block1 !== nothing
        bool, misr_block1_string = is_valid_misr_block(misr_block1)
        if bool != true
            error("make_location: Argument misr_block1 is invalid.")
        end
        location = location * '+' * misr_block1_string
        if misr_block2 !== nothing
            bool, misr_block2_string = is_valid_misr_block(misr_block2)
            if bool != true
                error("make_location: Argument misr_block2 is invalid.")
            end
            location = location * '-' * misr_block2_string
        else
            misr_block2 = 0
            misr_block2_string = ""
        end
    else
        misr_block1 = 0
        misr_block1_string = ""
        misr_block2 = 0
        misr_block2_string = ""
    end
    
    if misr_site !== nothing
        bool, misr_site_label = is_valid_misr_site(misr_site;
            cap = "TXT", sep = "_", sit = true, strict = false)
        if bool != true
            error("make_location: Argument misr_site is invalid.")
        end
        location = location * '+' * misr_site_label
    else
        misr_site = ""
        misr_site_label = ""
    end

    if location == ""
        location = "NOLOC"
    end

    # Set the output value:
    loc = (
        misr_path1 = misr_path1,
        misr_path1_string = misr_path1_string,
        misr_path2 = misr_path2,
        misr_path2_string = misr_path2_string,
        misr_orbit1 = misr_orbit1,
        misr_orbit1_string = misr_orbit1_string,
        misr_orbit2 = misr_orbit2,
        misr_orbit2_string = misr_orbit2_string,
        misr_block1 = misr_block1,
        misr_block1_string = misr_block1_string,
        misr_block2 = misr_block2,
        misr_block2_string = misr_block2_string,
        misr_site = misr_site,
        misr_site_label = misr_site_label,
        location = location)

    return loc

end
