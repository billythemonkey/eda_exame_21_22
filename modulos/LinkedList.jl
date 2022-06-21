"""
Author: Andrei Razvan Oproiu
Date: Sat Jun 04 2022
"""

module MyLinkedList

mutable struct LinkedList
    NIL::Int64
    head::Int64
    key::Array#{Int64}
    prev::Array{Int64}
    next::Array{Int64}

    function LinkedList(size::Int64)
        new(1, 1, Array{String}(undef, size), ones(size), ones(size))
        # new(1, 1, ones(size), ones(size), ones(size))
    end
end


function search(L::LinkedList, k)
    x = L.head
    while x != L.NIL && L.key[x] != k
        x = L.next[x]
    end
    return x
end

function fillKey!(L::LinkedList, x::Int64, k)
    L.key[x] = k
end

function searchWithSentinel(L::LinkedList, k)
    x = L.next[L.NIL]
    while x != L.NIL && L.key[x] != k
        x = L.next[x]
    end
    return x
end

function insert!(L::LinkedList, x::Int64)
    L.next[x] = L.head
    if L.head != L.NIL
        L.prev[L.head] = x
    end
    L.head = x
    L.prev[x] = L.NIL
end

function insertWithSentinel!(L::LinkedList, x::Int64)
    L.next[x] = L.next[L.NIL]
    L.next[L.prev[L.NIL]] = x
    L.next[L.NIL] = x
    L.prev[x] = L.NIL
end

function delete!(L::LinkedList, x::Int64)
    NIL = 1
    if L.prev[x] != NIL
        L.prev[L.next[x]] = L.next[x]
    else
        L.head = L.next[x]
    end
    if L.next[x] != NIL
        L.next[L.prev[x]] = L.next[x]
    end
    return x
end

function deleteWithSentinel!(L::LinkedList, x::Int64)
    L.prev[L.next[x]] = L.next[x]
    L.next[L.prev[x]] = L.prev[x]
    return x
end

function printLinkedList(L::LinkedList)
    a = ["I", "P", "K", "N"]
    b = ones(Int64, length(L.next))
    for j in 1:length(a)
        print(a[j], " -> ")
        if j == 1
            for i in 1:length(L.key)
                b[i] = i

            end
            print(b)
        elseif j == 2
            print(L.prev)
        elseif j == 3
            print(L.key)
        elseif j == 4
            print(L.next)
        end

        println("")
    end
end
end