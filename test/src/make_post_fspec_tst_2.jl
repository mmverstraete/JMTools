"""
    post_fspec = make_post_fspec_tst_2()

# Purpose(s):
* Generate the output of `make_post_fspec.jl` for testing purposes. Test 2.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `post_fspec::AbstractString`: The specification of the output file.

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
julia> using JMTools

julia> include(JMTools_test * "src/make_post_fspec_tst_2.jl")
make_post_fspec_tst_2

julia> p_f_tst = "/Users/michel/Projects/MISR/Scrap/U=MMV/P=Explore/P192-P194+O080000-O082000+B056-B058/make_post_fpath/L2LAND/Map/Map_L2LAND_Bidirectional_Reflectance_Factor_P192-P194+O080000-O082000+B056-B058_R1100_2015-01-01+2015-05-19+yyyy-mm-dd_F08_0023.png"
"/Users/michel/Projects/MISR/Scrap/U=MMV/P=Explore/P192-P194+O080000-O082000+B056-B058/make_post_fpath/L2LAND/Map/Map_L2LAND_Bidirectional_Reflectance_Factor_P192-P194+O080000-O082000+B056-B058_R1100_2015-01-01+2015-05-19+yyyy-mm-dd_F08_0023.png"

julia> todaydate = Dates.format(Dates.today(), "yyyy-mm-dd")
"2023-06-07"

julia> p_f_tst = replace(p_f_tst, "yyyy-mm-dd" => todaydate)
"/Users/michel/Projects/MISR/Scrap/U=MMV/P=Explore/P192-P194+O080000-O082000+B056-B058/make_post_fpath/L2LAND/Map/Map_L2LAND_Bidirectional_Reflectance_Factor_P192-P194+O080000-O082000+B056-B058_R1100_2015-01-01+2015-05-19+2023-06-07_F08_0023.png"

julia> post_fspec = make_post_fspec_tst_2();

julia> @test post_fspec == p_f_tst
Test Passed
```
"""
function make_post_fspec_tst_2(
    )::AbstractString

    set_mroots("Reset");
    loc = make_location(;
        misr_path1 = 192, misr_path2 = 194,
        misr_orbit1 = 80000, misr_orbit2 = 82000,
        misr_block1 = 56, misr_block2 = 58);
    post_fspec = make_post_fspec("Map", "L2LAND", "Bidirectional_Reflectance_Factor";
        user = "MMV", project = "Explore",
        loc = loc, resolution = 1100)

    return post_fspec

end
