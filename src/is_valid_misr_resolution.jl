"""
    bool, misr_resolution_string = is_valid_misr_resolution(misr_resolution;
        misr_prdct = "", misr_camera = "", misr_band = "")

# Purpose:
Determine whether the given `misr_resolution` is a valid MISR spatial resolution for the specified product.

# Required positional argument(s):
* `misr_resolution::Integer`: The spatial resolution of the specified product.

# Optional keyword(s):
* `misr_prdct::AbstractString = ""`: The MISR product acronym.
* `misr_camera::AbstractString = ""`: The MISR camera name.
* `misr_band::AbstractString = ""`: The MISR spectral band name.

# Returned value(s):
* `bool::Bool`: Whether `misr_resolution` is valid or not.
* `misr_resolution_string::Integer`: The string version of the MISR spatial resolution.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s): 
* The output variable `misr_resolution_string` is only used in the MISR-HR context.

# Example(s):
```julia
julia> using JMTools

julia> bool, misr_resolution_string = is_valid_misr_resolution(1100)
(true, "R1100")

julia> bool, misr_resolution_string = is_valid_misr_resolution(1100; misr_prdct = "L1RCCM")
(true, "R1100")

julia> bool, misr_resolution_string = is_valid_misr_resolution(1100; misr_prdct = "L1RTGM", misr_camera = "DF", misr_band = "Blue")
(true, "R1100")

julia> bool, misr_resolution_string = is_valid_misr_resolution(1100; misr_prdct = "L1RTGM", misr_camera = "AA", misr_band = "Red")
(false, "")

julia> bool, misr_resolution_string = is_valid_misr_resolution(275; misr_prdct = "L1RTGM", misr_camera = "AA", misr_band = "Red")
(true, "R275")
```
"""
function is_valid_misr_resolution(
    misr_resolution::Integer;
    misr_prdct::AbstractString = "",
    misr_camera::AbstractString = "",
    misr_band::AbstractString = "",
    )::Tuple{Bool, AbstractString}

    # Set the list of valid camera names:
    valid_misr_resolution = [
        275,
        1100,
        2200,
        4400,
        17600]

    if misr_prdct == ""
        bool = (misr_resolution in valid_misr_resolution)
        misr_resolution_string = "R" * string(misr_resolution)
    elseif misr_prdct == "AGP"
        if misr_resolution == 1100
            bool = true
            misr_resolution_string = "R" * string(misr_resolution)
        else
            bool = false
            misr_resolution_string = ""
        end
    elseif misr_prdct == "L1BROW"
        if misr_resolution == 2200
            bool = true
            misr_resolution_string = "R" * string(misr_resolution)
        else
            bool = false
            misr_resolution_string = ""
        end
    elseif misr_prdct == "L1GMP"
        if misr_resolution == 17600
            bool = true
            misr_resolution_string = "R" * string(misr_resolution)
        else
            bool = false
            misr_resolution_string = ""
        end
    elseif (misr_prdct == "L1REGM") | (misr_prdct == "L1RTGM")
        bool = is_valid_misr_camera(misr_camera)
        if bool != true
            bool = false
            misr_resolution_string = ""
        else
            if ((misr_camera == "AN") | (misr_band == "Red")) & (misr_resolution == 275)
                bool = true
                misr_resolution_string = "R" * string(misr_resolution)
            elseif (misr_camera != "AN") & (misr_band != "Red") & (misr_resolution == 1100)
                bool = true
                misr_resolution_string = "R" * string(misr_resolution)
            else
                bool = false
                misr_resolution_string = ""
            end
        end
    elseif (misr_prdct == "L1RELM") | (misr_prdct == "L1RTLM")
        bool = is_valid_misr_camera(misr_camera)
        if bool != true
            bool = false
            misr_resolution_string = ""
        else
            if misr_resolution == 275
                bool = true
                misr_resolution_string = "R" * string(misr_resolution)
            end
        end
    elseif misr_prdct == "L1RCCM"
        if misr_resolution == 1100
            bool = true
            misr_resolution_string = "R" * string(misr_resolution)
        else
            bool = false
            misr_resolution_string = ""
        end
    elseif misr_prdct == "L2AERO"
        if misr_resolution == 4400
            bool = true
            misr_resolution_string = "R" * string(misr_resolution)
        else
            bool = false
            misr_resolution_string = ""
        end
    elseif misr_prdct == "L2LAND"
        if misr_resolution == 1100
            bool = true
            misr_resolution_string = "R" * string(misr_resolution)
        else
            bool = false
            misr_resolution_string = ""
        end
    else
        bool = false
        misr_resolution_string = ""
    end

    return bool, misr_resolution_string

end
