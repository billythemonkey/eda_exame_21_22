module QuickSort

function quick_sort!(A::Array, p::Int64, r::Int64)
    if p < r
        q = partition!(A, p, r)
        quick_sort!(A, p, q - 1)
        quick_sort!(A, q + 1, r)
    end

end
function partition!(A::Array, p::Int64, r::Int64)
    x = A[r]

    i = p - 1
    for j = p:r-1
        if A[j] <= x
            i = i + 1
            temp = A[i]
            A[i] = A[j]
            A[j] = temp
        end
    end
    temp = A[i+1]
    A[i+1] = A[r]
    A[r] = temp
    return i + 1
end

end

export quick_sort!