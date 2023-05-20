```@meta
CurrentModule = JMTools
```

# JMTools Package Documentation

Welcome to [JMTools](https://github.com/mmverstraete/JMTools), a Julia language package that offers generic tools to manipulate MISR and MISR-HR variables and data files. Some of those functions may rely on the [JMtk15](https://github.com/mmverstraete/) package.

The Multi-angle Imaging SpectroRadiometer (MISR) instrument is one of five instruments aboard NASA's Earth Observation Terra satellite launched on 18 December 1999. MISR has been collecting data on the causes and effects of climate change in the atmosphere and at the planetary surface every day since 24 February 2000, and is expected to continue operating until early 2027. A wide range of geophysical products are available on a per-orbit basis at spatial resolutions varying between 275 m and 17.6 km, depending on the product. Higher-level (L3) products with a global coverage and at coarser spatial resolution are also available.

Detailed information on the scientific context of this project is available on-line from:

* the [NASA Terra mission](https://terra.nasa.gov/about/mission),
* the [MISR instrument](https://misr.jpl.nasa.gov/), including a complete bibliography of thousands of published papers and reports,
* the [NASA Atmospheric Science Data Center](https://asdc.larc.nasa.gov/project/MISR), and
* the [MISR Toolkit](https://github.com/nasa/MISR-Toolkit).

## Package status and Acknowledgments

This package is part of a larger project to port functionalities previously developed in the IDL language to the open source Julia environment. It is currently under development (Work in Progress, WIP), and additional functions may be added later, time permitting.

The `test` and `doc` subdirectories contain test functions and documentation for those functions, respectively.

All functions and files published as part of this `JMtk15` package are provided under the MIT License, i.e., without any warranty about the their usability or effectiveness in your own applications. See the LICENSE file in this repository for more details.

Please check this site regularly for updates and send bug reports or suggestions through GitHub: I will attempt to address those in future releases, time permitting.

## Pre-requisites and Installation

The effective use of this `JMTools` package requires access to the following resources:

* the `Mtk` shared library `libMisrToolkit.so.1.5.0`,
* a set of third party libraries supporting HDF and NetCDF file formats, as well as additional utilities,
* the [JMtk15](https://github.com/mmverstraete/) package, and
* MISR data files, as appropriate.

The `Mtk` and third party libraries can be installed on Intel `x86_32` or `x86_64` Linux, macOS, or Windows platforms as explained on the MISR Toolkit web site mentioned above. As of March 2023, the simplest approach to use this `JMtk15` package on an Apple `aarch_64` MacBook equipped with a M1 or M2 chip is to port an existing working installation from an Intel-based platform and run under the `Rosetta 2` environment: All that is required is to copy the `Mtk` and `/usr/local/hdfeoslibs` directories in exactly the same locations on the Mx platform, and to use the `x86_64` version of Julia (see the [juliaup](https://github.com/JuliaLang/juliaup) for more details on installing multiple versions of Julia). Platform-specific libraries for the `aarch_64` architecture may be developed at a later stage.

MISR data are freely accessible from the NASA ASDC web site mentioned above.

Please refer to the `JMtk15` documentation for further details on that package.

## Index of functions

```@index
```

## Main module

```@docs
JMTools
```

## Functions

```@docs
current_misr_prdct_version
fnm2meta
is_from_misr_path
is_valid_misr_block
is_valid_misr_camera
is_valid_misr_orbit
is_valid_misr_path
is_valid_misr_prdct
is_valid_misr_resolution
is_valid_misr_site
is_valid_misrhr_prdct
mk_misr_fname
mk_misr_fpath
mk_misr_fspec
```
