include("../modulos/Graph.jl")
include("../modulos/LinkedList.jl")
using .MyGraph, .MyLinkedList

"""
Author: Andrei Razvan Oproiu
Date: Tue Apr 19 2022
"""

    
@enum Color BLACK WHITE GRAY

mutable struct Queue
    head::Int64
    tail::Int64
    mem::Array{MyGraph.Vertix}

    function Queue(size)
        new(1, 1, Array{MyGraph.Vertix}(size))
    end
end

function isEmpty(q::Queue)
    if q.head == q.tail && q.head != 1
        println("Underflow error")
        return true
    end
    return false
end

function enqueue!(q::Queue, v::MyGraph.Vertix)
    q.mem[q.tail] = v
    if q.tail == length(q.mem)
        q.tail = 1
    else
        q.tail += 1
    end
end

function dequeue!(q::Queue)

    x = q.mem[q.head]
    if q.head == length(q.mem)
        q.head = 1
    else
        q.head = q.head + 1
    end
    return x

end

function print(q::Queue)
    println("Queue head = ", q.head)
    println("Queue tail = ", q.tail)
    println("Queue memory = ", q.memory)
end



function BFS(g::Graph, s::Vertix)
    NIL = 1
    subGraph = graphWithoutSource(g, s)

    for v in subGraph.vec_v
        v.color = WHITE::Color
        v.d = typemax(Int64)
        v.π = NIL
    end
    s.color = GRAY::Color
    s.d = 0
    s.π = NIL
    q = MyQueue.Queue(10)
    MyQueue.enqueue!(q, s)
    while q != MyQueue.isEmpty(q)
        u = dequeue!(q)
        for v in MyGraph.getAdj(g, u)
            if v.color == WHITE::Color
                v.color = GRAY::Color
                v.d = u.d + 1
                v.π = u.key
                enqueue!(q, v)
            end
        end
        u.color = BLACK::Color
    end
end


function main()
    N = 10
    l = MyLinkedList.LinkedList(N)
    mem = Array{MyLinkedList.LinkedList}(undef, N)
    G = MyGraph.Graph()

    # println(l,"---------" ,mem)

    # println(G)

    a = MyGraph.Vertix(10)
    b = MyGraph.Vertix(9)
    c = MyGraph.Vertix(8)
    d = MyGraph.Vertix(7)
    e = MyGraph.Vertix(6)
    f = MyGraph.Vertix(5)

    ab = MyGraph.Edge(a.key, b.key)
    bc = MyGraph.Edge(b.key, c.key)
    cd = MyGraph.Edge(c.key, d.key)
    da = MyGraph.Edge(d.key, a.key)
    ae = MyGraph.Edge(a.key, e.key)
    ef = MyGraph.Edge(e.key, f.key)
    fa = MyGraph.Edge(f.key, a.key)
    

    MyGraph.addVertix!(G, a)
    MyGraph.addVertix!(G, b)
    MyGraph.addVertix!(G, c)
    MyGraph.addVertix!(G, d)
    MyGraph.addVertix!(G, e)
    MyGraph.addVertix!(G, f)

    MyGraph.addEdge!(G, ab)
    MyGraph.addEdge!(G, bc)
    MyGraph.addEdge!(G, cd)
    MyGraph.addEdge!(G, da)
    MyGraph.addEdge!(G, ae)
    MyGraph.addEdge!(G, ef)
    MyGraph.addEdge!(G, fa)

    println(G.vec_v)

    println("------------")

    println(G.vec_e)

    BFS(G, a)

    # for v in G.vec_v
    #     MyGraph.print(v)
    # end
end

main()