include("../modulos/LinkedList.jl")
include("../modulos/Stack.jl")
using .MyLinkedList, .MyStack

function fillMemory!(s::MyStack.Stack)
    for i in 1:length(s.memory)
        MyStack.push!(s, i)
    end
end

function next_position!(s::MyStack.Stack)
    MyStack.pop!(s)
end

function insert!(l::MyLinkedList.LinkedList, x::Int64, k)
    MyLinkedList.fillKey!(l, x, k)
    MyLinkedList.insert!(l, x)
end

function main()
    N = 10
    mem = MyStack.Stack(N)
    fillMemory!(mem)
    l = MyLinkedList.LinkedList(N)
    MyStack.print(mem)
    MyLinkedList.printLinkedList(l)

    pos1 = next_position!(mem)
    insert!(l, pos1, "A")

    MyLinkedList.printLinkedList(l)

end

main()