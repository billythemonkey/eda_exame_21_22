include("../modulos/Stack.jl")
include("../modulos/RedBlackTree.jl")

using .MyStack, .MyRedBlackTree

function fillMemory!(s::MyStack.Stack)
    for i in 1:length(s.memory)
        MyStack.push!(s, i)
    end
end


function next_position!(s::MyStack.Stack)
    MyStack.pop!(s)
end

function insert!(t::MyRedBlackTree.RedBlackTree, z::Int64, k)
    MyRedBlackTree.fillNode!(t, z, k)
    MyRedBlackTree.treeInsert!(t, z)
end

function delete!(s::MyStack.Stack, t::MyRedBlackTree.RedBlackTree, z::Int64)
    MyRedBlackTree.delete!(t, z)
    MyStack.push!(s,z)
end


function main()
    N = 10
    s = MyStack.Stack(N)
    fillMemory!(s)
    MyStack.print(s)

    t = MyRedBlackTree.RedBlackTree(N)
    println(t)
    
    pos1 = next_position!(s)
    insert!(t, pos1, 800)
    println(pos1)
    println(t)

    pos2 = next_position!(s)
    insert!(t, pos2, 700)
    println(pos2)
    println(t)

    pos3 = next_position!(s)
    insert!(t, pos3, 900)
    println(pos3)
    println(t)

    pos4 = next_position!(s)
    insert!(t, pos4, 1000)
    println(pos4)
    println(t)

    pos5 = next_position!(s)
    insert!(t, pos5, 1200)
    println(pos5)
    println(t)
end

main()