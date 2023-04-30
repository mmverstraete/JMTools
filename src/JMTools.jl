"""
    using JMTools

# Purpose:
Provide access to MISR Tools functions.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* JMtk15 package: Version 0.1.0 (2023-02-15).
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s): N/A.

# Example:
```julia
julia> using JMTools
[ Info: Precompiling JMTools [7ad2ddfe-0423-4906-9772-0d2d9ace2845]
```
"""
module JMTools

# using .JMtk15

# Package configuration:

# 1. Set the location of the MISR source and data files for this JMTools package:

# Define the default root directories for the project :
const JMTools_root = dirname(@__DIR__)
export JMTools_root
const JMTools_src = JMTools_root * "/src/"
export JMTools_src
const JMTools_test = JMTools_root * "/test/"
export JMTools_test
const JMTools_docs = JMTools_root * "/docs/"
export JMTools_docs


include(JMTools_src * "current_misr_prdct_version.jl")
export current_misr_prdct_version
include(JMTools_src * "fnm2meta.jl")
export fnm2meta
include(JMTools_src * "is_valid_misr_block.jl")
export is_valid_misr_block
include(JMTools_src * "is_valid_misr_camera.jl")
export is_valid_misr_camera
include(JMTools_src * "is_valid_misr_orbit.jl")
export is_valid_misr_orbit
include(JMTools_src * "is_valid_misr_path.jl")
export is_valid_misr_path
include(JMTools_src * "is_valid_misr_prdct.jl")
export is_valid_misr_prdct
include(JMTools_src * "is_valid_misr_resolution.jl")
export is_valid_misr_resolution
include(JMTools_src * "is_valid_misr_site.jl")
export is_valid_misr_site
include(JMTools_src * "is_valid_misrhr_prdct.jl")
export is_valid_misrhr_prdct
include(JMTools_src * "mk_misr_fname.jl")
export mk_misr_fname
include(JMTools_src * "mk_misr_fpath.jl")
export mk_misr_folder
include(JMTools_src * "mk_misr_fspec.jl")
export mk_misr_fspec


end
