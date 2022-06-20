"""
Author: Andrei Razvan Oproiu
Date: Fri Jun 17 2022
"""

include("InsertionSort.jl")
include("BubbleSort.jl")

import .InsertSort.insert_sort!, .BubbleSort.bubble_sort!


function main()
    A = [1, 4, 2, 7, 8, 9, 10]

    println(A)
    bubble_sort!(A)
    println(A)

end


main()