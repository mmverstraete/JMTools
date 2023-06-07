"""
    post_fspec = make_post_fspec_tst_1()

# Purpose(s):
* Generate the output of `make_post_fspec.jl` for testing purposes. Test 1.

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

julia> include(JMTools_test * "src/make_post_fspec_tst_1.jl")
make_post_fspec_tst_1

julia> p_f_tst = "~/U=MMV/P=Explore/P168-P170+O068000-O070000+B100-B110/make_post_fspec/L1RTGM/Map/Map_L1RTGM_radrd_P168-P170+O068000-O070000+B100-B110_2012-09-29+2013-02-14+yyyy-mm-dd_F03_0024.png"
"~/U=MMV/P=Explore/P168-P170+O068000-O070000+B100-B110/make_post_fspec/L1RTGM/Map/Map_L1RTGM_radrd_P168-P170+O068000-O070000+B100-B110_2012-09-29+2013-02-14+yyyy-mm-dd_F03_0024.png"

julia> todaydate = Dates.format(Dates.today(), "yyyy-mm-dd")
"2023-06-07"

julia> p_f_tst = replace(p_f_tst, "yyyy-mm-dd" => todaydate)
"~/U=MMV/P=Explore/P168-P170+O068000-O070000+B100-B110/make_post_fspec/L1RTGM/Map/Map_L1RTGM_radrd_P168-P170+O068000-O070000+B100-B110_2012-09-29+2013-02-14+2023-06-07_F03_0024.png"

julia> post_fspec = make_post_fspec_tst_1();

julia> @test post_fspec == p_f_tst
Test Passed
```
"""
function make_post_fspec_tst_1(
    )::AbstractString

    set_mroots("Unset");
    loc = make_location(;
        misr_path1 = 168, misr_path2 = 170,
        misr_orbit1 = 68000, misr_orbit2 = 70000,
        misr_block1 = 100, misr_block2 = 110);
    post_fspec = make_post_fspec("Map", "L1RTGM", "radrd", "";
        user = "MMV", project = "Explore",
        loc = loc, call_f = "make_post_fspec")

    return post_fspec

end
