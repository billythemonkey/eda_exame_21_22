module MyRedBlackTree
    

mutable struct RedBlackTree
    root::Int64

    vec_p::Array{Int64}
    vec_l::Array{Int64}
    vec_r::Array{Int64}
    vec_k::Array
    vec_c::Array{Bool}

    function RedBlackTree(size::Int64)
        new(1, ones(size), ones(size), ones(size), ones(size), Array{Bool}(undef, size))
    end
end 

function treeInsert!(t::RedBlackTree, z::Int64)
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
    t.vec_l[z] = NIL
    t.vec_r[z] = NIL
    t.vec_c[z] = true
    insertFixup!(t, z)
end

function insertFixup!(t::RedBlackTree, z::Int64)
    NIL = 1
    while t.vec_c[t.vec_p[z]] == true
        if t.vec_p[z] == t.vec_l[t.vec_p[t.vec_p[z]]]
            y = t.vec_r[t.vec_p[t.vec_p[z]]]
            if t.vec_c[y] == true
                t.vec_c[t.vec_p[z]] = false
                t.vec_c[y] = false
                t.vec_c[t.vec_p[t.vec_p[z]]] = true
                z = t.vec_p[t.vec_p[z]]
            elseif z == t.vec_r[t.vec_p[z]]
                z = t.vec_p[z]
                leftRotate!(t, z)
            else
                t.vec_c[t.vec_p[z]] = false
                t.vec_c[t.vec_p[t.vec_p[z]]] = true
                rigthRotate!(t, t.vec_p[t.vec_p[z]])
            end
        else

        end
    end
    t.vec_c[t.root] = false
end

function leftRotate!(t::RedBlackTree, x::Int64)
    NIL = 1
    y = t.vec_r[x]
    t.vec_r[x] = t.vec_l[y]
    if t.vec_l[y] != NIL
        t.vec_l[t.vec_p[y]] = x
    end
    t.vec_p[y] = t.vec_p[x]
    if t.vec_p[x] == NIL
        t.root = y
    elseif x == t.vec_p[t.vec_l[x]]
        t.vec_p[t.vec_l[x]] = y
    else
        t.vec_p[t.vec_r[x]] = y
    end
    t.vec_l[y] = x
    t.vec_p[x] = y
end

function rigthRotate!(t::RedBlackTree, x::Int64)
    NIL = 1
    y = t.vec_l[x]
    t.vec_l[x] = t.vec_r[y]
    if t.vec_r[y] != NIL
        t.vec_r[t.vec_p[y]] = x
    end
    t.vec_p[y] = t.vec_p[x]
    if t.vec_p[x] == NIL
        t.root = y
    elseif x == t.vec_p[t.vec_r[x]]
        t.vec_p[t.vec_r[x]] = y
    else
        t.vec_p[t.vec_l[x]] = y
    end
    t.vec_r[y] = x
    t.vec_p[x] = y
end

end