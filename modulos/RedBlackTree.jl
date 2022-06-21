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
        if t.vec_k[z] < t.vec_k[x]
            x = t.vec_l[x]
        else
            x = t.vec_r[x]
        end
    end

    t.vec_p[z] = y
    if y == NIL
        t.root = z
    elseif t.vec_k[z] < t.vec_k[y]
        t.vec_l[y] = z
    else
        t.vec_r[y] = z
    end
    t.vec_l[z] = NIL
    t.vec_r[z] = NIL
    t.vec_c[z] = true
    insertFixup!(t, z)
end

function fillNode!(t::RedBlackTree, z::Int64, k)
    t.vec_k[z] = k
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
            else
                if z == t.vec_r[t.vec_p[z]]
                    z = t.vec_p[z]
                    leftRotate!(t, z)
                end
                t.vec_c[t.vec_p[z]] = false
                t.vec_c[t.vec_p[t.vec_p[z]]] = true
                rigthRotate!(t, t.vec_p[t.vec_p[z]])
            end
        else
            y = t.vec_l[t.vec_p[t.vec_p[z]]]
            if t.vec_c[y] == true
                t.vec_c[t.vec_p[z]] = false
                t.vec_c[y] = false
                t.vec_c[t.vec_p[t.vec_p[z]]] = true
                z = t.vec_p[t.vec_p[z]]
            else
                if z == t.vec_l[t.vec_p[z]]
                    z = t.vec_p[z]
                    rigthRotate!(t, z)
                end
                t.vec_c[t.vec_p[z]] = false
                t.vec_c[t.vec_p[t.vec_p[z]]] = true
                leftRotate!(t, t.vec_p[t.vec_p[z]])
            end
        end
    end
    t.vec_c[t.root] = false
end

function transplant!(t::RedBlackTree, u::Int64, v::Int64)
    NIL = 1
    if t.vec_p[u] == NIL
        t.root = v
    elseif u == t.vec_l[t.vec_p[u]]
        t.vec_l[t.vec_p[u]] = v
    else
        t.vec_r[t.vec_p[u]] = v
    end
    t.vec_p[v] = t.vec_p[u] 
end

function delete!(t::RedBlackTree, z::Int64)
    NIL = 1
    y = z
    y_original_color = t.vec_c[y]
    if t.vec_l[z] == NIL
        x = t.vec_r[z]
        transplant!(t, z, t.vec_r[z])
    elseif t.vec_r[z] == NIL
        x = t.vec_l[z]
        transplant!(t, z, t.vec_l[z])
    else
        y = treeMinimum(t, t.vec_r[z])
        y_original_color = t.vec_c[y]
        x = t.vec_r[y]
        if t.vec_p[y] == z
            t.vec_p[x] = y
        else
            transplant!(t, y, t.vec_r[y])
            t.vec_r[y] = t.vec_r[z]
            t.vec_p[t.vec_r[y]] = y
        end
        transplant!(t, z, y)
        t.vec_l[y] = t.vec_l[z]
        t.vec_p[t.vec_l[y]] = y
        t.vec_c[y] = t.vec_c[z]
    end
    if y_original_color == false
        deleteFixup!(t, x)
    end
end

function deleteFixup!(t::RedBlackTree, x::Int64)
    NIL = 1
    while x != t.root && t.vec_c[x] == false
        if x == t.vec_l[t.vec_p[x]]
            w = t.vec_r[t.vec_p[x]]
            if t.vec_c[w] == true
                t.vec_c[w] = false
                t.vec_c[t.vec_p[x]] = true
                leftRotate!(t, t.vec_p[x])
                w = t.vec_r[t.vec_p[x]]
            end
            if t.vec_c[t.vec_l[w]] == false && t.vec_c[t.vec_r[w]] == false
                t.vec_c[w] = true
                x = t.vec_p[x]
            else
                if t.vec_c[t.vec_r[w]] == false
                    t.vec_c[t.vec_l[w]] = false
                    t.vec_c[w] = true
                    rigthRotate!(t, w)
                    w = t.vec_r[t.vec_p[x]]
                end
                t.vec_c[w] = t.vec_c[t.vec_p[x]]
                t.vec_c[t.vec_p[x]] = false
                t.vec_c[t.vec_r[w]] = false
                leftRotate!(t, t.vec_p[x])
                x = t.root
            end
        else
            w = t.vec_l[t.vec_p[x]]
            if t.vec_c[w] == true
                t.vec_c[w] = false
                t.vec_c[t.vec_p[x]] = true
                rigthRotate!(t, t.vec_p[x])
                w = t.vec_l[t.vec_p[x]]
            end
            if t.vec_c[t.vec_r[w]] == false && t.vec_c[t.vec_l[w]] == false
                t.vec_c[w] = true
                x = t.vec_p[x]
            else
                if t.vec_c[t.vec_l[w]] == false
                    t.vec_c[t.vec_r[w]] = false
                    t.vec_c[w] = true
                    leftRotate!(t, w)
                    w = t.vec_l[t.vec_p[x]]
                end
                t.vec_c[w] = t.vec_c[t.vec_p[x]]
                t.vec_c[t.vec_p[x]] = false
                t.vec_c[t.vec_l[w]] = false
                rigthRotate!(t, t.vec_p[x])
                x = t.root
            end
        end
    end
    t.vec_c[x] = false
end

function treeMinimum(t::RedBlackTree, x::Int64)
    NIL = 1
    while t.vec_l[x] != NIL
        x = t.vec_l[x]
    end
end

function leftRotate!(t::RedBlackTree, x::Int64)
    NIL = 1
    y = t.vec_r[x]
    t.vec_r[x] = t.vec_l[y]
    if t.vec_l[y] != NIL
        t.vec_p[t.vec_l[y]] = x
    end
    t.vec_p[y] = t.vec_p[x]
    if t.vec_p[x] == NIL
        t.root = y
    elseif x == t.vec_p[t.vec_l[x]]
        t.vec_r[t.vec_p[x]] = y
    else
        t.vec_r[t.vec_p[x]] = y
    end
    t.vec_l[y] = x
    t.vec_p[x] = y
end

function rigthRotate!(t::RedBlackTree, x::Int64)
    NIL = 1
    y = t.vec_l[x]
    t.vec_l[x] = t.vec_r[y]
    if t.vec_r[y] != NIL
        t.vec_p[t.vec_r[y]] = x
    end
    t.vec_p[y] = t.vec_p[x]
    if t.vec_p[x] == NIL
        t.root = y
    elseif x == t.vec_p[t.vec_r[x]]
        t.vec_r[t.vec_p[x]] = y
    else
        t.vec_l[t.vec_p[x]] = y
    end
    t.vec_r[y] = x
    t.vec_p[x] = y
end

end