
mutable struct Stack
    top::Int
    memory::Array{Int64}

    function Stack(size)
        new(1, ones(Int64, size))
    end
end

function isEmpty(s)
    if s.top == 1
        return true
    end
    return false
end

function isFull(s)
    if s.top == (length(s.memory) + 1)
        return true
    end
    return false
end

function pop!(s)
    if isEmpty(s)
        println("Pop error: Stack Underflow.")
    else
        s.top -= 1
    end
    return s.memory[s.top]
end

function push!(s, value)
    if isFull(s)
        println("Push error: Stack Overflow.")
    else
        s.memory[s.top] = value
        s.top += 1
    end
end


mutable struct LinkedList
    head::Int64
    a_key::Array{Int64}
    a_next::Array{Int64}
    a_prev::Array{Int64}
    mem::Stack

    function LinkedList(size)
        s = Stack(size)
        for i in 1:size
            push!(s, i)
        end

        new(1, ones(size), ones(size), ones(size), s)
    end

end

function main()
    N = 10
    l = LinkedList(N)

    println(l)
end

main()
