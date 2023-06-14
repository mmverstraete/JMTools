"""
    orbit_date, orbit_date_string = orbit2date(misr_orbit; fmt = fmt)

# Purpose(s):
Retrieve the date of acquisition of the specified MISR Orbit.

# Positional argument(s):
* `misr_orbit::Integer`: The MISR Orbit number.

# Keyword argument(s):
* `fmt::Union{AbstractString, Nothing} = nothing`: The formatting rule to apply to the output value `orbit_date_string`.

# Return value(s):
* `orbit_date::Date`: The date of acquisition of the specified MISR Orbit.
* `orbit_date_string::Date`: The string representation of the date of acquisition of the specified MISR Orbit.

# Algorithm:
* This function relies on function `jMtkOrbitToTimeRange.jl` of the JMtk15 package to determine the date (and time) when the specified started to be acquired. The output value `orbit_date_string` can be formatted as follows:
- If `fmt == ""` or is not specified (default), the separator character between the year, month and day values is a dash ('-').
- If `fmt == "Datapool"`, the separator character between the year, month and day values is a dot ('.'). This option may be useful to access MISR data from the ASDC Datapool.
- If `fmt == "Julian"`, the output value `orbit_date_string` contains the Julian day number corresponding to `orbit_date`. This option may be useful when plotting time series data.
- If `fmt == "MISRHR"`, the separator character between the year, month and day values is suppressed. This option may be useful to set dates in MISR-HR filenames.

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

julia> using Dates

julia> orbit_date, orbit_date_string = orbit2date(68050)
(Date("2012-10-03"), "2012-10-03")
```

# Example 2:
```julia
julia> using JMTools

julia> using Dates

julia> orbit_date, orbit_date_string = orbit2date(68050; fmt = "Datapool")
(Date("2012-10-03"), "2012.10.03")
```

# Example 3:
```julia
julia> using JMTools

julia> using Dates

julia> orbit_date, orbit_date_string = orbit2date(68050; fmt = "Julian")
(Date("2012-10-03"), "2.4562037994444445e6")
```

# Example 4:
```julia
julia> using JMTools

julia> using Dates

julia> orbit_date, orbit_date_string = orbit2date(68050; fmt = "MISRHR")
(Date("2012-10-03"), "20121003")
```
"""
function orbit2date(
    misr_orbit::Integer;
    fmt::Union{AbstractString, Nothing} = nothing
    )::Tuple{Dates.Date, AbstractString}

    start_time, end_time = jMtkOrbitToTimeRange(misr_orbit)

    orbit_date_string = String(start_time)
    orbit_date = DateTime(orbit_date_string, "yyyy-mm-ddTHH:MM:SSZ")
    orbit_date_string = Dates.format(DateTime(orbit_date), "yyyy-mm-dd")
    if fmt !==  nothing
        if fmt !== ""
            if fmt === "Datapool"
                orbit_date_string = replace(orbit_date_string, '-' => '.')
            elseif fmt === "Julian"
                orbit_date_string = string(datetime2julian(DateTime(orbit_date)))
            elseif fmt === "MISRHR"
                orbit_date_string = replace(orbit_date_string, '-' => "")
            end
        end
    end

    return orbit_date, orbit_date_string

end
