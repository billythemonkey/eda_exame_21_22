
module InsertSort
using DataFrames
function insertion_sort!(A::Array)
    for j in 2:length(A)
        key = A[j]
        i = j - 1
        while i > 1 && A[i] > key
            A[i+1] = A[i]
            i -= 1
        end
        A[i+1] = key
    end
end


function insertion_sort_d!(D::DataFrame)
    println(names(D))
    rows = copy.(eachrow(D))
    for j = 2:nrow(D)
        key = rows[j][1]
        println(key)
        i = j - 1
        while i > 0 && rows[i][1] > key
            rows[i+1] = rows[i]
            i -= 1
        end
        rows[i+1][1] = key
    end
end

end

export insertion_sort!, insertion_sort_d!