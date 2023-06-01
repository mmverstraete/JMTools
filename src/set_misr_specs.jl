"""
    misr_specs = set_misr_specs()

# Purpose(s):
* Return an immutable named `Tuple` containing key technical specifications of the MISR instrument.

# Positional argument(s): None.

# Keyword argument(s): None.

# Return value(s):
* `misr_specs::Tuple`: Key technical specifications of the MISR instrument.

# Algorithm:
* This function defines and returns an immutable named `Tuple` containing key technical specifications of the MISR instrument. Elements of the `Tuple` can be accessed by their index (rank in the `Tuple`) or by their names.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Note(s): None.

# Example 1:
```julia
julia> using JMTools

julia> misr_specs = set_misr_specs();
```

# Example 2:
```julia
julia> using JMTools

julia> misr_specs.camera_names
9-element Vector{String}:
 "DF"
 "CF"
 "BF"
 "AF"
 "AN"
 "AA"
 "BA"
 "CA"
 "DA"
```

# Example 3:
```julia
julia> using JMTools

julia> misr_specs.band_positions[findfirst(x -> (x == "Green"), misr_specs.band_names)]
 557.5
```

# Example 4:
```julia
julia> using JMTools

julia> misr_specs.channel_names[12]
"BF_NIR"
```
"""
function set_misr_specs(
    )::NamedTuple{(:nmodes, :mode_names, :ncameras, :camera_names, :camera_ids, :camera_angles, :nbands, :band_names, :band_ids, :band_positions, :nchannels, :channel_names, :channel_ids), Tuple{Int64, Vector{String}, Int64, Vector{String}, Vector{UnitRange{Int64}}, Vector{Float64}, Int64, Vector{String}, Vector{UnitRange{Int64}}, Vector{Float64}, Int64, Vector{String}, Vector{UnitRange{Int64}}}}

    misr_specs = (
        nmodes = 2,
        mode_names = ["GM", "LM"],

        ncameras = 9,
        camera_names = ["DF", "CF", "BF", "AF", "AN", "AA", "BA", "CA", "DA"],
        camera_ids = [1:9],
        camera_angles = [70.3, 60.2, 45.7, 26.2, 0.1, 26.2, 45.7, 60.2, 70.6],

        nbands = 4,
        band_names = ["Blue", "Green", "Red", "NIR"],
        band_ids = [1:4],
        band_positions = [446.4, 557.5, 671.7, 866.4],

        nchannels = 36,
        channel_names = [
            "DF_Blue", "DF_Green", "DF_Red", "DF_NIR",
            "CF_Blue", "CF_Green", "CF_Red", "CF_NIR",
            "BF_Blue", "BF_Green", "BF_Red", "BF_NIR",
            "AF_Blue", "AF_Green", "AF_Red", "AF_NIR",
            "AN_Blue", "AN_Green", "AN_Red", "AN_NIR",
            "AA_Blue", "AA_Green", "AA_Red", "AA_NIR",
            "BA_Blue", "BA_Green", "BA_Red", "BA_NIR",
            "CA_Blue", "CA_Green", "CA_Red", "CA_NIR",
            "DA_Blue", "DA_Green", "DA_Red", "DA_NIR"],
        channel_ids = [1:36]
        )

        return misr_specs

end
