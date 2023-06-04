"""
    misr_fname = make_misr_fname_tst_1300()

# Purpose(s):
* Generate the output of `make_misr_fname.jl` for testing purposes. Test 1300: For a MISR AGP file, using only the required positional arguments.

# Positional argument(s): None.

# Keyword argument(s): None.

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

julia> include(JMTools_test * "src/make_misr_fname_tst_1300.jl")
make_misr_fname_tst_1300

julia> misr_fname = make_misr_fname_tst_1300();

julia> @test misr_fname == [
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf"
    "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"]
Test Passed
```
"""
function make_misr_fname_tst_1300()
    misr_prdct = "L1RTGM"
    misr_path = 168
    misr_orbit = 68050
    misr_camera = "*"
    misr_fname = make_misr_fname(misr_prdct, misr_path;
        misr_orbit = misr_orbit, misr_camera = misr_camera)

    return misr_fname

end
