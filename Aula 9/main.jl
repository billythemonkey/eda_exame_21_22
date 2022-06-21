include("../modulos/Graph.jl")
include("../modulos/LinkedList.jl")
using .MyGraph, .MyLinkedList

function main()
    N = 10
    l = MyLinkedList.LinkedList(N)
    mem = Array{MyLinkedList.LinkedList}(undef, N)
    G = MyGraph.Graph()

    # println(l,"---------" ,mem)

    # println(G)

    a = MyGraph.Vertix(10)
    b = MyGraph.Vertix(9)

    ab = MyGraph.Edge(a.key, b.key)

    MyGraph.addVertix!(G, a)
    MyGraph.addVertix!(G, b)

    MyGraph.addEdge!(G, ab)

    println(G.vec_v)

    println("------------")

    println(G.vec_e)

    # for v in G.vec_v
    #     MyGraph.print(v)
    # end
end

main()