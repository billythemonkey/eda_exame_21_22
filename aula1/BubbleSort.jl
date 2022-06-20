"""
Author: Andrei Razvan Oproiu
Date: Fri Jun 17 2022
"""

module BubbleSort
    function bubble_sort!(A::Array)
        for i=1:(length(A) - 1)

            swapped = false

            for j=1:reverse(A, length(A) - 1)
                
                if A[j] > A[j + 1]
                    temp = A[j + 1]
                    A[j + 1] = A[j]
                    A[j] = temp

                    swapped = true
                end
            end

            if !swapped
                break
            end
        end
    end
end

export bubble_sort!