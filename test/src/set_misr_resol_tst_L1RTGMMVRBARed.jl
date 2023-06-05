"""
    misr_resolution = set_misr_resol_tst_L1RTGMMVRBARed()

# Purpose(s):
Generate the output of `set_misr_resol.jl` for testing purposes. Test L1RTGMMVRBARed: For a MISR `L1RTGMMVR` data product.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misr_resolution::Integer`: The spatial resolution of the product specified by the arguments.

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

julia> include(JMTools_test * "src/set_misr_resol_tst_L1RTGMMVRBARed.jl")
set_misr_resol_tst_L1RTGMMVRBARed

julia> misr_resolution = set_misr_resol_tst_L1RTGMMVRBARed();

julia> @test misr_resolution == 275
Test Passed
```
"""
function set_misr_resol_tst_L1RTGMMVRBARed(
    )::Integer

    misr_resolution = set_misr_resol("L1RTGMMVR"; misr_camera = "BA", misr_band = "Red")

    return misr_resolution

end
