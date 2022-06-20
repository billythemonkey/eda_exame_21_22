include("../modulos/MyMergeSort.jl")

using Random, Distributions, Plots

import .MyMergeSort.merge_sort!

function main()
    N = 10
    A = rand(Normal(0, 100), N)
    println(A)
    merge_sort!(A, 1, N)


    println(A)
end

main()