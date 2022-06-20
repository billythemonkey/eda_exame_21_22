module MyMergeSort
function merge_sort!(A, p, r)
    if p < r
        q = convert(Int64, floor((p + r) / 2))
        ## q = convert(Int64, floor((p + r)/ 2))
        #merge_sort!(A, p, q)
        #merge_sort!(A, q + 1, r)
        merge!(A, p, q, r)
    end
end
function merge!(A, p, q, r)
    n1 = q - p + 1

    n2 = r - q

    L = zeros(n1 + 1)
    R = zeros(n2 + 1)
    for i = 2:n1
        L[i] = A[p+i-1]
    end
    for j = 2:n2
        R[j] = A[q+j]
    end

    L[n1+1] = Inf
    R[n2+1] = Inf

    i = 1
    j = 1

    for k = p:r
        if L[i] <= R[j]
            A[k] = L[i]
            i = i + 1
        else
            A[k] = R[j]
            j = j + 1
        end
    end
end
end

export merge_sort!