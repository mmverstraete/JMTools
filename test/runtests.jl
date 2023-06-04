using JMTools
using Test

# ==========================================================================================
@testset "JMTools.jl" begin
# ---------------------------------------------------------- fnm2meta
    include(JMTools_test * "src/fnm2meta_tst_0100.jl")
    misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta_tst_0100();
    @test misr_prdct_id == "AGP"
    @test misr_mode_id == ""
    @test misr_path_id == 168
    @test misr_orbit_id == 0
    @test misr_camera_id == ""
    @test misr_site_id == ""
    @test misr_version_id == "F01_24"
    @test ext_id == ".hdf"

    include(JMTools_test * "src/fnm2meta_tst_1000.jl")
    misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta_tst_1000();
    @test misr_prdct_id == "L1GMP"
    @test misr_mode_id == ""
    @test misr_path_id == 168
    @test misr_orbit_id == 68050
    @test misr_camera_id == ""
    @test misr_site_id == ""
    @test misr_version_id == "F03_0013"
    @test ext_id == ".hdf"

    include(JMTools_test * "src/fnm2meta_tst_1400.jl")
    misr_prdct_id, misr_mode_id, misr_path_id, misr_orbit_id, misr_camera_id, misr_site_id, misr_version_id, ext_id = fnm2meta_tst_1400();
    @test misr_prdct_id == "L1RTLM"
    @test misr_mode_id == "LM"
    @test misr_path_id == 168
    @test misr_orbit_id == 68050
    @test misr_camera_id == "AN"
    @test misr_site_id == "SITE_SKUKUZA"
    @test misr_version_id == "F03_0024"
    @test ext_id == ".hdf"
# ---------------------------------------------------------- is_from_misr_path
    include(JMTools_test * "src/is_from_misr_path_tst_1.jl")
    bool = is_from_misr_path_tst_1();
    @test bool == true

    include(JMTools_test * "src/is_from_misr_path_tst_2.jl")
    bool = is_from_misr_path_tst_2();
    @test bool == false
# ---------------------------------------------------------- is_valid_misr_block
    include(JMTools_test * "src/is_valid_misr_block_tst_005.jl")
    bool, misr_block_string = is_valid_misr_block_tst_005();
    @test bool == true
    @test misr_block_string == "B005"

    include(JMTools_test * "src/is_valid_misr_block_tst_168.jl")
    bool, misr_block_string = is_valid_misr_block_tst_168();
    @test bool == true
    @test misr_block_string == "B168"

    include(JMTools_test * "src/is_valid_misr_block_tst_246.jl")
    bool, misr_block_string = is_valid_misr_block_tst_246();
    @test bool == false
    @test misr_block_string == ""
# ---------------------------------------------------------- is_valid_misr_camera
    include(JMTools_test * "src/is_valid_misr_camera_tst_1.jl")
    bool = is_valid_misr_camera_tst_1();
    @test bool == true

    include(JMTools_test * "src/is_valid_misr_camera_tst_2.jl")
    bool = is_valid_misr_camera_tst_2();
    @test bool == false
# ---------------------------------------------------------- is_valid_misr_orbit
    include(JMTools_test * "src/is_valid_misr_orbit_tst_068050.jl")
    bool, misr_orbit_string = is_valid_misr_orbit_tst_068050();
    @test bool == true
    @test misr_orbit_string == "O068050"

    include(JMTools_test * "src/is_valid_misr_orbit_tst_000900.jl")
    bool, misr_orbit_string = is_valid_misr_orbit_tst_000900();
    @test bool == false
    @test misr_orbit_string == ""
# ---------------------------------------------------------- is_valid_misr_path
    include(JMTools_test * "src/is_valid_misr_path_tst_168.jl")
    bool, misr_path_string = is_valid_misr_path_tst_168();
    @test bool == true
    @test misr_path_string == "P168"

    include(JMTools_test * "src/is_valid_misr_path_tst_268.jl")
    bool, misr_path_string = is_valid_misr_path_tst_268();
    @test bool == false
    @test misr_path_string == ""
# ---------------------------------------------------------- is_valid_misr_prdct
    include(JMTools_test * "src/is_valid_misr_prdct_tst_0100.jl")
    bool, prdct_name, prdct_full_name, prdct_esdt = is_valid_misr_prdct_tst_0100();
    @test bool == true
    @test prdct_name == "AGP"
    @test prdct_full_name == "Ancillary Geographic Product"
    @test prdct_esdt == "MIANCAGP"
# ---------------------------------------------------------- is_valid_misrhr_prdct
    include(JMTools_test * "src/is_valid_misrhr_prdct_tst_1.jl")
    bool, prdct_full_name = is_valid_misrhr_prdct_tst_1();
    @test bool == true
    @test prdct_full_name == "Terrain Projected Radiance Global Mode Product at Native Spatial Resolution"
# ---------------------------------------------------------- make_location
    include(JMTools_test * "src/make_location_tst_1.jl")
    location = make_location_tst_1();
    @test location == "NOLOC"

    include(JMTools_test * "src/make_location_tst_2.jl")
    location = make_location_tst_2();
    @test location == "P168"

    include(JMTools_test * "src/make_location_tst_3.jl")
    location = make_location_tst_3();
    @test location == "P168+O068050+B110"

    include(JMTools_test * "src/make_location_tst_4.jl")
    location = make_location_tst_4();
    @test location == "P168-P170+O068050-O072000+SITE_SKUKUZA"
# ---------------------------------------------------------- make_misr_fname
    include(JMTools_test * "src/make_misr_fname_tst_0100.jl")
    misr_fname = make_misr_fname_tst_0100();
    @test misr_fname == ["MISR_AM1_AGP_P168_F01_24.hdf"]

    include(JMTools_test * "src/make_misr_fname_tst_0101.jl")
    misr_fname = make_misr_fname_tst_0101();
    @test misr_fname == ["MISR_AM1_AGP_P168_F01_24.hdf"]

    include(JMTools_test * "src/make_misr_fname_tst_1300.jl")
    misr_fname = make_misr_fname_tst_1300();
    @test misr_fname == [
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.hdf"]
# ---------------------------------------------------------- make_misr_fpath
    include(JMTools_test * "src/make_misr_fpath_tst_0100.jl")
    misr_fpath = make_misr_fpath_tst_0100();
    @test misr_fpath == "~/P168/AGP/"

    include(JMTools_test * "src/make_misr_fpath_tst_1300.jl")
    misr_fpath = make_misr_fpath_tst_1300();
    @test misr_fpath == "/Volumes/MISR_Data0/P168/L1RTGM/"
# ---------------------------------------------------------- make_misr_fspec
    include(JMTools_test * "src/make_misr_fspec_tst_1300.jl")
    misr_fspec = make_misr_fspec_tst_1300();
    @test misr_fspec[1] == "/Volumes/MISR_Data0/P168/L1RTGM/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"

    include(JMTools_test * "src/make_misr_fspec_tst_1301.jl")
    misr_fspec = make_misr_fspec_tst_1301();
    @test misr_fspec[1] == "my_path/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.hdf"

    include(JMTools_test * "src/make_misr_fspec_tst_1500.jl")
    misr_fspec = make_misr_fspec_tst_1500();
    @test misr_fspec == [
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_DF_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_CF_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_BF_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_AF_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_AN_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_AA_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_BA_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_CA_F04_0025.hdf",
        "/Volumes/MISR_Data0/P168/L1RCCM/MISR_AM1_GRP_RCCM_GM_P168_O068050_DA_F04_0025.hdf"]
        # ---------------------------------------------------------- make_misrhr_fname
    include(JMTools_test * "src/make_misrhr_fname_tst_L1B316868050110AN.jl")
    misrhr_fname = make_misrhr_fname_tst_L1B316868050110AN()
    @test misrhr_fname[1] ==
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.00-1.hdf"

    include(JMTools_test * "src/make_misrhr_fname_tst_L1B316868050110.jl")
    misrhr_fname = make_misrhr_fname_tst_L1B316868050110();
    @test misrhr_fname == [
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.B110_MISRHR_V2.02-0.hdf"
        "MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.B110_MISRHR_V2.02-0.hdf"]

    include(JMTools_test * "src/make_misrhr_fname_tst_BRF16868050110.jl")
    misrhr_fname = make_misrhr_fname_tst_BRF16868050110();
    @test misrhr_fname[1] == "MISR_HR_BRF_2012-10-03_P168_O068050_B110_V2.02-0.hdf"

    include(JMTools_test * "src/make_misrhr_fname_tst_RPV16868050110.jl")
    misrhr_fname = make_misrhr_fname_tst_RPV16868050110();
    @test misrhr_fname[1] == "MISR_HR_RPV_2012-10-03_P168_O068050_B110_V2.02-0_SL.hdf"

    include(JMTools_test * "src/make_misrhr_fname_tst_TIP16868050110.jl")
    misrhr_fname = make_misrhr_fname_tst_TIP16868050110();
    @test misrhr_fname[1] == "MISR_HR_TIP_2012-10-03_P168_O068050_B110_V2.02-0_GRN.hdf"
# ---------------------------------------------------------- make_misrhr_fpath
    include(JMTools_test * "src/make_misrhr_fpath_tst_L1B3168110_1.jl")
    misrhr_fpath = make_misrhr_fpath_tst_L1B3168110_1();
    @test misrhr_fpath == "~/P168/B110/L1B3/"

    include(JMTools_test * "src/make_misrhr_fpath_tst_L1B3168110_2.jl")
    misrhr_fpath = make_misrhr_fpath_tst_L1B3168110_2();
    @test misrhr_fpath == "/Volumes/MISR-HR/P168/B110/L1B3/"
# ---------------------------------------------------------- make_misrhr_fspec
    include(JMTools_test * "src/make_misrhr_fspec_tst_BRF16868050110.jl")
    misrhr_fspec = make_misrhr_fspec_tst_BRF16868050110();
    @test misrhr_fspec == ["/Volumes/MISR-HR/P168/B110/BRF/brf/MISR_HR_BRF_2012-10-03_P168_O068050_B110_V2.02-0.hdf"]

    include(JMTools_test * "src/make_misrhr_fspec_tst_L1B316868050110.jl")
    misrhr_fspec = make_misrhr_fspec_tst_L1B316868050110();
    @test misrhr_fspec == [
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DF_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CF_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BF_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AF_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AN_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_AA_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_BA_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_CA_F03_0024.B110_MISRHR_V2.02-0.hdf",
        "~/mypath/MISR_AM1_GRP_TERRAIN_GM_P168_O068050_DA_F03_0024.B110_MISRHR_V2.02-0.hdf"]
# ---------------------------------------------------------- set_current_prdct_version
    include(JMTools_test * "src/set_current_prdct_version_tst_0100.jl")
    prdct_version = set_current_prdct_version_tst_0100();
    @test prdct_version == "F01_24"

    include(JMTools_test * "src/set_current_prdct_version_tst_1000.jl")
    prdct_version = set_current_prdct_version_tst_1000();
    @test prdct_version == "F03_0013"
# ---------------------------------------------------------- set_misr_specs
    include(JMTools_test * "src/set_misr_specs_tst_1.jl")
    misr_specs = set_misr_specs_tst_1();
    @test misr_specs.nmodes == 2
    @test misr_specs.mode_names == ["GM", "LM"]
    @test misr_specs.ncameras == 9
    @test misr_specs.camera_names == ["DF", "CF", "BF", "AF", "AN", "AA", "BA", "CA", "DA"]
    @test misr_specs.camera_ids == [1:9]
    @test misr_specs.camera_angles == [70.3, 60.2, 45.7, 26.2, 0.1, 26.2, 45.7, 60.2, 70.6]
    @test misr_specs.nbands == 4
    @test misr_specs.band_names == ["Blue", "Green", "Red", "NIR"]
    @test misr_specs.band_ids == [1:4]
    @test misr_specs.band_positions == [446.4, 557.5, 671.7, 866.4]
    @test misr_specs.nchannels == 36
    @test misr_specs.channel_names == [
        "DF_Blue", "DF_Green", "DF_Red", "DF_NIR",
        "CF_Blue", "CF_Green", "CF_Red", "CF_NIR",
        "BF_Blue", "BF_Green", "BF_Red", "BF_NIR",
        "AF_Blue", "AF_Green", "AF_Red", "AF_NIR",
        "AN_Blue", "AN_Green", "AN_Red", "AN_NIR",
        "AA_Blue", "AA_Green", "AA_Red", "AA_NIR",
        "BA_Blue", "BA_Green", "BA_Red", "BA_NIR",
        "CA_Blue", "CA_Green", "CA_Red", "CA_NIR",
        "DA_Blue", "DA_Green", "DA_Red", "DA_NIR"]
    @test misr_specs.channel_ids == [1:36]
# ---------------------------------------------------------- set_mroots
    include(JMTools_test * "src/set_mroots_tst_1.jl")
    mroots = set_mroots_tst_1();
    @test mroots[1] == "/dir/misr"
    @test mroots[2] == "/dir/misrhr"
    @test mroots[3] == "/dir/post"
    @test mroots[4] == "/dir/agp"
    @test mroots[5] == "/dir/scrap"

    include(JMTools_test * "src/set_mroots_tst_2.jl")
    mroots = set_mroots_tst_2();
    @test mroots[1] == "/dir/misr"
    @test mroots[2] == "/dir/misrhr/newdir"
    @test mroots[3] == "/dir/post/nextcase"
    @test mroots[4] == "/dir/agp"
    @test mroots[5] == "/dir/scrap"

    include(JMTools_test * "src/set_mroots_tst_3.jl")
    mroots = set_mroots_tst_3();
    @test mroots[1] == "ENV[\"MROOT_MISR\"] is not set."
    @test mroots[2] == "ENV[\"MROOT_MISRHR\"] is not set."
    @test mroots[3] == "ENV[\"MROOT_POST\"] is not set."
    @test mroots[4] == "ENV[\"MROOT_AGP\"] is not set."
    @test mroots[5] == "ENV[\"MROOT_SCRAP\"] is not set."

    include(JMTools_test * "src/set_mroots_tst_4.jl")
    mroots = set_mroots_tst_4();
    @test mroots[1] == "/Volumes/MISR_Data0/"
    @test mroots[2] == "/Volumes/MISR-HR/"
    @test mroots[3] == "/Volumes/Output/Post/"
    @test mroots[4] == "/Users/michel/Projects/MISR/Data/AGP/"
    @test mroots[5] == "/Users/michel/Projects/MISR/Scrap/"
# ---------------------------------------------------------- split_location
    include(JMTools_test * "src/split_location_tst_1.jl")
    misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location_tst_1();
    @test (misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site) == (0, 0, 0, 0, 0, 0, "")

    include(JMTools_test * "src/split_location_tst_2.jl")
    misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location_tst_2();
    @test (misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site) == (168, 0, 68050, 0, 110, 0, "")

    include(JMTools_test * "src/split_location_tst_3.jl")
    misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site = split_location_tst_3();
    @test (misr_path1, misr_path2, misr_orbit1, misr_orbit2, misr_block1, misr_block2, misr_site) == (168, 170, 68050, 72000, 110, 115, "SITE_SKUKUZA")
# ---------------------------------------------------------- split_misr_fpath
    include(JMTools_test * "src/split_misr_fpath_tst_1300.jl")
    mroot_misr, misr_path, misr_prdct = split_misr_fpath_tst_1300();
    @test mroot_misr == "/Volumes/MISR_Data0/"
    @test misr_path == 168
    @test misr_prdct == "L1RTGM"

    include(JMTools_test * "src/split_misr_fpath_tst_1500.jl")
    mroot_misr, misr_path, misr_prdct = split_misr_fpath_tst_1500();
    @test mroot_misr == ""
    @test misr_path == 168
    @test misr_prdct == "L1RCCM"


end
# ==========================================================================================
