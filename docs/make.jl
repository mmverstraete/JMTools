using JMTools
using Documenter

DocMeta.setdocmeta!(JMTools, :DocTestSetup, :(using JMTools); recursive=true)

makedocs(;
    modules=[JMTools],
    authors="Michel Verstraete <MMVerstraete@gmail.com> and contributors",
    repo="https://github.com/mmverstraete/JMTools/blob/{commit}{path}#{line}",
    sitename="JMTools",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
deploydocs(; repo="github.com/mmverstraete/JMTools.jl", push_preview=true)
