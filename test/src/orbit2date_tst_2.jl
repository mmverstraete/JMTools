"""
    orbit_date, orbit_date_string = orbit2date_tst_2()

# Purpose(s):
* Generate the output of `orbit2date.jl` for testing purposes. Test 2: Datapool format.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `orbit_date::Date`: The date of acquisition of the specified MISR Orbit.
* `orbit_date_string::Date`: The string representation of the date of acquisition of the specified MISR Orbit.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Example 1:
```julia
julia> using Package

julia> using Test

julia> using Dates

julia> include(JMTools_test * "src/orbit2date_tst_2.jl")
orbit2date_tst_2

julia> orbit_date, orbit_date_string = orbit2date_tst_2();

julia> @test orbit_date == Date("2012-10-03")
Test Passed

julia> @test orbit_date_string == "2012.10.03"
Test Passed
```
"""
function orbit2date_tst_2(
    )::Tuple{Dates.Date, AbstractString}

    orbit_date, orbit_date_string = orbit2date(68050; fmt = "Datapool")

    return orbit_date, orbit_date_string

end
