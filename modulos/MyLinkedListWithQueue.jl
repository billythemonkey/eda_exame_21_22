
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


mutable struct LinkedList
    head::Int64
    a_key::Array{Int64}
    a_next::Array{Int64}
    a_prev::Array{Int64}
    mem::Queue

    function LinkedList(size)
        q = Queue(size)
        for i in 1:size
            enqueue!(q, i)
        end

        new(1, ones(size), ones(size), ones(size), q)
    end

end

function main()
    N = 10
    l = LinkedList(N)
    println(l)

    v = dequeue!(l.mem)

end

main()
