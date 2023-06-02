"""
    location = make_location_tst_2()

# Purpose(s):
* Generate the output of `make_location.jl` for testing purposes. Test 2: One keyword arguments.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `location::AbstractString`: A `string` describing the geographical area covered by a MISR or MISR-HR deliverable product.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-02-15).

# Example 1:
```julia
julia> using JMTools

julia> using Test

julia> include(JMTools_test * "src/make_location_tst_2.jl")
make_location_tst_2

julia> location = make_location_tst_2();

julia> @test location == "P168"
Test Passed
```
"""
function make_location_tst_2(
    )::AbstractString

    location = make_location(misr_path1 = 168)

    return location

end
