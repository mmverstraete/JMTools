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

using Dates

using JMtk15

using StaticArrays

using Statistics

# Package configuration:

# 1. Set the location of the MISR source and data files for this JMTools package:

# Define the default root directories for the project :
const JMTools_root = pkgdir(JMTools)
export JMTools_root
const JMTools_src = JMTools_root * "/src/"
export JMTools_src
const JMTools_test = JMTools_root * "/test/"
export JMTools_test
const JMTools_docs = JMTools_root * "/docs/"
export JMTools_docs


include(JMTools_src * "fnm2meta.jl")
export fnm2meta
include(JMTools_src * "hr2lr.jl")
export hr2lr
include(JMTools_src * "is_from_misr_path.jl")
export is_from_misr_path
include(JMTools_src * "is_valid_ftype.jl")
export is_valid_ftype
include(JMTools_src * "is_valid_misr_band.jl")
export is_valid_misr_band
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
include(JMTools_src * "is_valid_misr_subprdct.jl")
export is_valid_misr_subprdct
include(JMTools_src * "is_valid_misrhr_prdct.jl")
export is_valid_misrhr_prdct
include(JMTools_src * "is_valid_misrhr_subprdct.jl")
export is_valid_misrhr_subprdct
include(JMTools_src * "is_valid_post_prdct.jl")
export is_valid_post_prdct
include(JMTools_src * "is_valid_post_subprdct.jl")
export is_valid_post_subprdct
include(JMTools_src * "lr2hr.jl")
export lr2hr
include(JMTools_src * "make_location.jl")
export make_location
include(JMTools_src * "make_misr_fname.jl")
export make_misr_fname
include(JMTools_src * "make_misr_fpath.jl")
export make_misr_fpath
# include(JMTools_src * "make_misr_fspec.jl")
# export make_misr_fspec
include(JMTools_src * "make_misrhr_fname.jl")
export make_misrhr_fname
include(JMTools_src * "make_misrhr_fpath.jl")
export make_misrhr_fpath
include(JMTools_src * "make_post_fname.jl")
export make_post_fname
include(JMTools_src * "make_post_fpath.jl")
export make_post_fpath
# include(JMTools_src * "make_post_fspec.jl")
# export make_post_fspec
include(JMTools_src * "orbit2date.jl")
export orbit2date
include(JMTools_src * "percentile.jl")
export percentile
include(JMTools_src * "set_current_prdct_version.jl")
export set_current_prdct_version
include(JMTools_src * "set_misr_resol.jl")
export set_misr_resol
include(JMTools_src * "set_misr_specs.jl")
export set_misr_specs
include(JMTools_src * "set_mroots.jl")
export set_mroots
include(JMTools_src * "set_current_prdct_version.jl")
export set_current_prdct_version
include(JMTools_src * "sp_fspec.jl")
export sp_fspec
include(JMTools_src * "split_location.jl")
export split_location
include(JMTools_src * "split_misr_fpath.jl")
export split_misr_fpath
include(JMTools_src * "split_misrhr_fpath.jl")
export split_misrhr_fpath
include(JMTools_src * "split_post_fpath.jl")
export split_post_fpath


# include(JMTools_src * "find_matches.jl")
# export find_matches

end
