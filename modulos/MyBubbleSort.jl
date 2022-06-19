module BubbleSort
function bubble_sort!(A::Array)
    for i in 1:(length(A)-1)
        for j in reverse(i+1:length(A))
            if A[j] < A[j-1]
                temp = A[j]
                A[j] = A[j-1]
                A[j-1] = temp
            end
        end
    end
end

function bubble_sort_improved!(A::Array)
    for i in 1:(length(A)-1)
        swapped = false
        for j in reverse(i+1:length(A))
            if A[j] < A[j-1]
                temp = A[j]
                A[j] = A[j-1]
                A[j-1] = temp

                swapped = true
            end
        end
        if !swapped
            break
        end
    end
end
end

export bubble_sort!, bubble_sort_improved!