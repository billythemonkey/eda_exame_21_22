"""
Author: Andrei Razvan Oproiu
Date: Fri Jun 17 2022
"""

module InsertSort
    function insert_sort!(A::Array)
        for j = 2:length(A)
            key = A[j]
            i = j - 1
            while i > 0 && A[i]  > key
                A[i+1] = A[i]
                i = i - 1
            end
            A[i+1] = key
        end
    end
end

export insert_sort!