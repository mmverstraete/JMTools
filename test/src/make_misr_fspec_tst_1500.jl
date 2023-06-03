"""
    misr_fspec = make_misr_fspec_tst_1500()

# Purpose(s):
* Generate the output of `make_misr_fpath.jl` for testing purposes. Test 1500: For a MISR L1RCCM file.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misr_fspec::Vector{AbstractString}`: The specification(s) (path(s) and name(s)) of the MISR data file(s) correponding to the input arguments.

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

julia> include(JMTools_test * "src/make_misr_fspec_tst_1500.jl")
make_misr_fspec_tst_1500

julia> misr_fspec = make_misr_fspec_tst_1500();

julia> @test misr_fspec == [
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_DF_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_BF_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_AF_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf",
    "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf"]
Test Passed
```
"""
function make_misr_fspec_tst_1500(
    )::Vector{AbstractString}

    misr_fspec = make_misr_fspec("L1RCCM", 168;
        misr_orbit = 68050, misr_camera = "*")

    return misr_fspec

end
