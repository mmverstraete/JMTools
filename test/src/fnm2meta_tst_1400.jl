"""
    misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta_tst_1400()

# Purpose:
Generate the output of `fnm2meta.jl` for testing purposes. Test 1400: For a MISR `L1RTLM` file.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Example:
```julia
julia> using JMTools

julia> using Test

julia> include(JMTools_test * "src/fnm2meta_tst_1400.jl")
fnm2meta_tst_1400

julia> misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta_tst_1400();

julia> @test misr_prdct_id == "L1RTLM"
Test Passed

julia> @test misr_mode_id == "LM"
Test Passed

julia> @test misr_path_id == 168
Test Passed

julia> @test misr_orbit_id == 68050
Test Passed

julia> @test misr_camera_id == "AN"
Test Passed

julia> @test misr_site_id == "SITE_SKUKUZA"
Test Passed

julia> @test misr_version_id == "F03_0024"
Test Passed

julia> @test ext_id == ".hdf"
Test Passed
```
"""
function fnm2meta_tst_1400()
    fname = "MISR_AM1_GRP_TERRAIN_LM_P168_O068050_AN_SITE_SKUKUZA_F03_0024.hdf"
    misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta(fname)

    return misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id

end
