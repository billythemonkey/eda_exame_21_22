include("../modulos/BinaryTree.jl")
include("../modulos/Stack.jl")


using .MyBinaryTree, .MyStack

function fillMemory!(s::MyStack.Stack)
    for i in 1:length(s.memory)
        MyStack.push!(s, i)
    end
end


function next_position!(s::MyStack.Stack)
    MyStack.pop!(s)
end

function insert!(t::MyBinaryTree.BinaryTree, z::Int64, k)
    MyBinaryTree.fillNode!(t, z, k)
    MyBinaryTree.treeInsert!(t, z)
end

function delete!(s::MyStack.Stack, t::MyBinaryTree.BinaryTree, z::Int64)
    MyBinaryTree.treeDelete!(t, z)
    MyStack.push!(s,z)
end
function main()
    N = 10
    s = MyStack.Stack(N)
    fillMemory!(s)
    t = MyBinaryTree.BinaryTree(N)

    MyStack.print(s)
    println(t)

    pos1 = next_position!(s)
    insert!(t, pos1, 900)

    MyStack.print(s)
    println(t)

    pos2 = next_position!(s)
    insert!(t, pos2, 1000)
    
    MyStack.print(s)
    println(t)

    pos3 = next_position!(s)
    insert!(t, pos3, 600)
    
    MyStack.print(s)
    println(t)

    delete!(s, t, pos2)
    MyStack.print(s)
    println(t)

    pos4 = next_position!(s)
    insert!(t, pos4, 950)
    
    MyStack.print(s)
    println(t)

    pos5 = next_position!(s)
    insert!(t, pos5, 925)
    
    MyStack.print(s)
    println(t)

    pos6 = next_position!(s)
    insert!(t, pos6, 700)
    
    MyStack.print(s)
    println(t)

    pos7 = next_position!(s)
    insert!(t, pos7, 500)
    
    MyStack.print(s)
    println(t)

    MyBinaryTree.inOrderTreeWalk(t, 10)

end



main()