"""
Author: Andrei Razvan Oproiu
Date: Tue Apr 19 2022
"""



mutable struct Queue
    head::Int64
    tail::Int64
    mem::Array{Int64}

    function Queue(size)
        new(1, 1, ones(size))
    end
end

function isEmpty(q::Queue)
    if q.head == q.tail && q.head != 1
        println("Underflow error")
        return true
    end
    return false
end

function isFull(q::Queue)
    if q.head == q.tail + 1
        println("Overflow error")
        return true
    end
    return false
end

function enqueue!(q::Queue, v::Int64)
    q.mem[q.tail] = v
    if q.tail == length(q.mem)
        q.tail = 1
    else
        q.tail += 1
    end
end

function dequeue!(q::Queue)

    x = q.mem[q.head]
    if q.head == length(q.mem)
        q.head = 1
    else
        q.head = q.head + 1
    end
    return x

end



function main()
    N = 10
    q = Queue(N)

    for i in 1:N
        enqueue!(q, i)
        println(q)
    end



    v1 = dequeue!(q)
    println(v1)
    println(q)

    v2 = dequeue!(q)
    println(v2)
    println(q)
    v3 = dequeue!(q)
    println(v3)
    println(q)
    v4 = dequeue!(q)
    println(v4)
    println(q)

    enqueue!(q, v3)
    println(q)


end

main()
