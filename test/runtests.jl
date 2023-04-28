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
    @test bool == true
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
