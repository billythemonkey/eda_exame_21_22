"""
Author: Andrei Razvan Oproiu
Date: Tue May 03 2022
"""
module MyStack
mutable struct Stack
    top::Int64
    memory::Array

    function Stack(size::Int64)
        new(1, ones(Int64, size))
    end
end

function isEmpty(s::Stack)
    if s.top == 1
        return true
    end
    return false
end

function pop!(s::Stack)
    if isEmpty(s)
        println("Pop error: Stack Empty.")
    else
        s.top -= 1
    end
    return s.memory[s.top]
end

function push!(s::Stack, value)
    s.memory[s.top] = value
    s.top += 1
    # if s.top != length(s.memory)
    #     s.top += 1
    # end
end

function print(s::Stack)
    println("Stack head = ", s.top)
    println("Stack memory = ", s.memory)
end
end

