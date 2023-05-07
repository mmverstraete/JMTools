using JMTools
using Test

# ==========================================================================================
@testset "JMTools.jl" begin
# ---------------------------------------------------------- current_misr_prdct_version
    include(JMTools_test * "src/current_misr_prdct_version_tst_0100.jl")
    misr_prdct_version = current_misr_prdct_version_tst_0100()
    @test misr_prdct_version == "F01_24"

    include(JMTools_test * "src/current_misr_prdct_version_tst_1000.jl")
    misr_prdct_version = current_misr_prdct_version_tst_1000();
    @test misr_prdct_version == "F03_0013"
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
# ---------------------------------------------------------- is_valid_misr_path
    include(JMTools_test * "src/is_valid_misr_path_tst_168.jl")
    bool, misr_path_string = is_valid_misr_path_tst_168();
    @test bool == true
    @test misr_path_string == "P168"
# ---------------------------------------------------------- is_valid_misr_prdct
    include(JMTools_test * "src/is_valid_misr_prdct_tst_0100.jl")
    bool, prdct_name, prdct_full_name, prdct_esdt = is_valid_misr_prdct_tst_0100();
    @test bool == true
    @test prdct_name == "AGP"
    @test prdct_full_name == "Ancillary Geographic Product"
    @test prdct_esdt == "MIANCAGP"
# ---------------------------------------------------------- is_valid_misrhr_prdct
    include(JMTools_test * "src/is_valid_misrhr_prdct_tst_1.jl")
    bool = is_valid_misrhr_prdct_tst_1();
    @test bool == true
# ---------------------------------------------------------- mk_misr_fname
    include(JMTools_test * "src/mk_misr_fname_tst_0100.jl")
    misr_fname = mk_misr_fname_tst_0100()
    @test misr_fname == ["MISR_AM1_AGP_P168_F01_24.hdf"]

    include(JMTools_test * "src/mk_misr_fname_tst_0101.jl")
    misr_fname = mk_misr_fname_tst_0101()
    @test misr_fname == ["MISR_AM1_AGP_P168_F01_24.hdf"]

end
# ==========================================================================================
