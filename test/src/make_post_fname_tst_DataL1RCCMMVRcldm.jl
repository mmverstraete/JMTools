"""
    post_fname = make_post_fname_tst_DataL1RCCMMVRcldm()

# Purpose(s):
* Generate the output of `make_post_fname.jl` for testing purposes. Test DataL1RCCMMVRcldm: For a MISR-HR L1RCCMMVR file containing `cldm` data.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `post_fname::AbstractString`: The name of the output file.

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

julia> using Test

julia> include(JMTools_test * "src/make_post_fname_tst_DataL1RCCMMVRcldm.jl")
make_post_fname_tst_DataL1RCCMMVRcldm

julia> p_f_tst = "Data_L1RCCMMVR_cldm_P168+O068050+B110_R1100_2012-10-03+yyyy-mm-dd_v3.0.0.nc"
"Data_L1RCCMMVR_cldm_P168+O068050+B110_R1100_2012-10-03+yyyy-mm-dd_v3.0.0.nc"

julia> todaydate = Dates.format(Dates.today(), "yyyy-mm-dd")
"2023-06-07"

julia> p_f_tst = replace(p_f_tst, "yyyy-mm-dd" => todaydate)
"Data_L1RCCMMVR_cldm_P168+O068050+B110_R1100_2012-10-03+2023-06-07_v3.0.0.nc"

julia> post_fname = make_post_fname_tst_DataL1RCCMMVRcldm();

julia> @test post_fname == p_f_tst
Test Passed
```
"""
function make_post_fname_tst_DataL1RCCMMVRcldm(
    )::AbstractString

    loc = make_location(;
        misr_path1 = 168,
        misr_orbit1 = 68050,
        misr_block1 = 110)
    post_fname = make_post_fname("Data", "L1RCCMMVR", "cldm", "";
        loc = loc, resolution = 1100, ext = ".nc")

    return post_fname

end
