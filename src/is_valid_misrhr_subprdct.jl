"""
    bool, subprdct_name = is_valid_misrhr_subprdct(misrhr_prdct, misrhr_subprdct)

# Purpose:
Determine whether the specified `misrhr_subprdct` is a valid subproduct of `mishr_prdct`, and return the full subproduct name.

# Positional argument(s):
* `misrhr_prdct::AbstractString`: The MISR-HR product acronym.
* `misrhr_subprdct::AbstractString`: The MISR-HR subproduct acronym.

# Keyword argument(s): None.

# Return value(s):
* `bool::Bool`: Whether `misrhr_subprdct` acronym is a valid subproduct of `misrhr_prdct` or not.
* `subprdct_name::AbstractString`: The full name of the MISR-HR subproduct.

# Algorithm:
* This function verifies that the positional argument `misrhr_subprdct` is a valid MISR-HR subproduct acronym of `misrhr_prdct`.

# Licensing:
* Mtk C Library: Copyright © 2005 California Institute of Technology,
    [Caltech license](https://github.com/nasa/MISR-Toolkit/blob/master/LICENSE).
* Julia function: Copyright © 2023 Michel M. Verstraete,
    [MIT license](https://opensource.org/licenses/MIT).

# Versioning:
* Mtk C Library: Version 1.5.
* Julia function: Version 0.1.0 (2023-05-15).

# Notes:
* This function currently recognizes only the MISR product and subproduct acronyms defined below; additional acronyms can be added as needed.

# Example(s):
```julia
julia> using JMTools

julia> is_valid_misrhr_subprdct("TIP", "fapar")
(true, "FAPAR")
```
"""
function is_valid_misrhr_subprdct(
    misrhr_prdct::AbstractString,
    misrhr_subprdct::AbstractString
    )::Tuple{Bool, AbstractString}

    if misrhr_prdct == "L1RCCMMVR"
        valid_misrhr_subprdcts = [
            "cldm" "Cloud Mask";
            "cldfrac" "Cloud fraction";
            "clrfrac" "Clear Fraction";
            "rccm1" "RCCM1";
            "rccm2" "RCCM2";
            "rccm3" "RCCM3";
            "rccm4" "RCCM4"]
        sub_acronyms = valid_misrhr_subprdcts[:, 1]
        if misrhr_subprdct in sub_acronyms
            idx = findfirst(x -> x == misrhr_subprdct, sub_acronyms)
            bool = true
            subprdct_name = valid_misrhr_subprdcts[idx, 2]
        else
            bool = false
            subprdct_name = ""
        end

    elseif misrhr_prdct == "L1RTGMMVR"
        valid_misrhr_subprdcts = [
            "radrd" "Radiance with RDQI";
            "rad" "Radiance";
            "refl" "Reflectance";
            "rdqi" "RDQI";
            "scalf" "Scaling Factor";
            "convf" "Conversion Factor";
            "bhr" "BiHemispherical Reflectance";
            "dhr" "Directional Hemispherical Reflectance";
            "aniso" "Anisotropy"]
        sub_acronyms = valid_misrhr_subprdcts[:, 1]
        if misrhr_subprdct in sub_acronyms
            idx = findfirst(x -> x == misrhr_subprdct, sub_acronyms)
            bool = true
            subprdct_name = valid_misrhr_subprdcts[idx, 2]
        else
            bool = false
            subprdct_name = ""
        end

    elseif misrhr_prdct == "L1B3"
        valid_misrhr_subprdcts = [
            "radrd" "Radiance with RDQI";
            "rad" "Radiance";
            "refl" "Reflectance";
            "rdqi" "RDQI";
            "scalf" "Scaling Factor";
            "convf" "Conversion Factor";
            "bhr" "BiHemispherical Reflectance";
            "dhr" "Directional Hemispherical Reflectance";
            "aniso" "Anisotropy"]
        sub_acronyms = valid_misrhr_subprdcts[:, 1]
        if misrhr_subprdct in sub_acronyms
            idx = findfirst(x -> x == misrhr_subprdct, sub_acronyms)
            bool = true
            subprdct_name = valid_misrhr_subprdcts[idx, 2]
        else
            bool = false
            subprdct_name = ""
        end

    elseif misrhr_prdct == "BRF"
        valid_misrhr_subprdcts = [
            "brf" "Bidirectional Reflectance Factor"]
        sub_acronyms = valid_misrhr_subprdcts[:, 1]
        if misrhr_subprdct in sub_acronyms
            idx = findfirst(x -> x == misrhr_subprdct, sub_acronyms)
            bool = true
            subprdct_name = valid_misrhr_subprdcts[idx, 2]
        else
            bool = false
            subprdct_name = ""
        end

    elseif misrhr_prdct == "RPV"
        valid_misrhr_subprdcts = [
            "rho" "Rho";
            "k" "k";
            "theta" "Theta";
            "rhoc" "RhoC";
            "cost" "Cost";
            "sigrho" "Sigma Rho";
            "sigk" "Sigma k";
            "sigtheta" "Sigma Theta"]
        sub_acronyms = valid_misrhr_subprdcts[:, 1]
        if misrhr_subprdct in sub_acronyms
            idx = findfirst(x -> x == misrhr_subprdct, sub_acronyms)
            bool = true
            subprdct_name = valid_misrhr_subprdcts[idx, 2]
        else
            bool = false
            subprdct_name = ""
        end

    elseif misrhr_prdct == "TIP"
        valid_misrhr_subprdcts = [
            "absnir" "Absorption NIR";
            "absvis" "Absorption VIS";
            "bhrnir" "BHR NIR";
            "bhrvis" "BHR VIS";
            "effasymnir" "Effective Asymmetry Factor NIR";
            "effasymvis" "Effective Asymmetry Factor VIS";
            "efflai" "Effective LAI";
            "effssanir" "Effective Single Scattering Albedo NIR";
            "effssavis" "Effective Single Scattering Albedo VIS";
            "green" "Green priors";
            "obscovarflx" "Observed Covariance of Fluxes";
            "priorbhrnir" "Prior BHR NIR";
            "priorbhrvis" "Prior BHR VIS";
            "priorbhrspc" "Prior BRH Spectral";
            "snow" "Snow priors";
            "stdpriors" "Standard priors";
            "stddevparams" "Standard Deviation Model Parameters";
            "trnnir" "Transmission NIR";
            "trnvis" "Transmission VIS";
            "trubkgdalbnir" "True Background Albedo NIR";
            "trubkgdalbvis" "True Background Albedo VIS";
            "uncert" "Uncertainty";
            "fapar" "FAPAR"]
        sub_acronyms = valid_misrhr_subprdcts[:, 1]
        if misrhr_subprdct in sub_acronyms
            idx = findfirst(x -> x == misrhr_subprdct, sub_acronyms)
            bool = true
            subprdct_name = valid_misrhr_subprdcts[idx, 2]
        else
            bool = false
            subprdct_name = ""
        end

    else
        bool = false
        subprdct_name = ""
    end

    return bool, subprdct_name

end