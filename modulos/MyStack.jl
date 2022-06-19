"""
Author: Andrei Razvan Oproiu
Date: Tue May 03 2022
"""


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


function main()
    N = 10
    s = Stack(N)

    for i in 1:N
        push!(s, i)
        println(s)
    end

    v1 = pop!(s)
    println(v1)
    println(s)
    v2 = pop!(s)
    println(v2)
    println(s)
    v3 = pop!(s)
    println(v3)
    println(s)
    v4 = pop!(s)
    println(v4)
    println(s)

    push!(s, v2)
    println(s)
end

main()

