"""
Author: Andrei Razvan Oproiu
Date: Tue May 31 2022
"""

module MyBinaryTree
mutable struct BinaryTree
    root::Int64

    vec_p::Array{Int64}
    vec_l::Array{Int64}
    vec_r::Array{Int64}
    vec_key::Array

    function BinaryTree(N)
        new(1, ones(N), ones(N), ones(N), ones(N))
    end
end

function inOrderTreeWalk(t, x)
    NIL = 1
    if x != NIL
        inOrderTreeWalk(t, t.vec_l[x])
        println(t.vec_key[x])
        inOrderTreeWalk(t, t.vec_r[x])
    end
end

function treeSearch(t::BinaryTree, x::Int64, k)
    NIL = 1
    if x == NIL || k == t.vec_key[x]
        return x
    end
    if k < t.vec_key[x]
        treeSearch(t, t.vec_l[x], k)
    end
    treeSearch(t, t.vec_r[x], k)

end

function treeMinimum(t::BinaryTree, x::Int64)
    NIL = 1
    while t.vec_l[x] != NIL
        x = t.vec_l[x]
    end
end
function treeMaximum(t::BinaryTree, x::Int64)
    NIL = 1
    while t.vec_r[x] != NIL
        x = t.vec_r[x]
    end
end

function treeSuccessor(t::BinaryTree, x::Int64)
    NIL = 1
    if t.vec_r[x] != NIL
        return treeMinimum(t, t.vec_r[x])
    end
    y = t.vec_p[x]
    while y != NIL && x == t.vec_r[y]
        x = y
        y = t.vec_p[y]
    end
    return y
end

function transplant!(t::BinaryTree, u, v)
    NIL = 1
    if t.vec_p[u] == NIL
        t.root = v
    elseif u == t.vec_p[t.vec_l[u]]
        t.vec_p[t.vec_l[u]] = v
    else
        t.vec_p[t.vec_r[u]] = v
    end
    if v != NIL
        t.vec_p[v] = t.vec_p[u]
    end
end

function treeDelete!(t::BinaryTree, z::Int64)
    NIL = 1
    if t.vec_l[z] == NIL
        transplant!(t, z, t.vec_r[z])
    elseif t.vec_r[z] == NIL
        transplant!(t, z, t.vec_l[z])
    else
        y = treeMinimum(t, t.vec_r[z])
        if t.vec_p[y] != z
            transplant!(t, y, t.vec_r[y])
            t.vec_r[y] = t.vec_r[z]
            t.vec_r[t.vec_p[y]] = y
        end
        transplant!(t, z, y)
        t.vec_l[y] = t.vec_l[z]
        t.vec_l[t.vec_p[y]] = y
    end
end

function iterativeTreeSearch(t::BinaryTree, x::Int64, k)
    NIL = 1
    while x != NIL && k != t.vec_key[x]
        if k < t.vec_key[x]
            x = t.vec_l[x]          
        else
            x = t.vec_r[x]
        end
    end
end

function fillNode!(t, z, key)
    t.vec_key[z] = key
end

function treeInsert!(t, z)
    NIL = 1
    y = NIL
    x = t.root

    while x != NIL
        y = x
        if t.vec_key[z] < t.vec_key[x]
            x = t.vec_l[x]
        else
            x = t.vec_r[x]
        end
    end

    t.vec_p[z] = y
    if y == NIL
        t.root = z
    elseif t.vec_key[z] < t.vec_key[y]
        t.vec_l[y] = z
    else
        t.vec_r[y] = z
    end

end








end