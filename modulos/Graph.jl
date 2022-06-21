

module MyGraph

include("Queue.jl")
using .MyQueue

@enum Color BLACK WHITE GRAY

mutable struct Vertix
    key::Int64
    π::Int64
    d::Int64
    color::Color
    adj::Vector{Int64}

    function Vertix(key::Int64)
        new(key, 1, 1, WHITE::Color, ones(0))
    end
end

mutable struct Edge
    x::Int64
    y::Int64

    function Edge(x::Int64, y::Int64)
        new(x, y)
    end
end

mutable struct Graph
    vec_v::Vector{Vertix}
    vec_e::Vector{Edge}
    function Graph()
        new(Vector{Vertix}(undef, 0), Vector{Edge}(undef, 0))
    end
end

function print(v::Vertix)
    println("key = $v.key, π = $v.π, d = $v.d, color = $v.color, adj = $v.adj")
end 

function addVertix!(g::Graph, v::Vertix)
    push!(g.vec_v, v)
end

function graphWithoutSource(g::Graph, s::Vertix)
    subGraph = Graph()
    for v in g.vec_v
        if v.key != s.key
            push!(subGraph.vec_v, v)
        end
    end
    return subGraph
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
    MyQueue.enqueue!(q, s.key)
    while q != MyQueue.isEmpty(q)
        u.key = dequeue!(q)
        
    end
end

function getAdj(g::Graph, v::Vertix)
    adj = Vector{Vertix}(length(v.adj))
    for key in v.adj
        for v in g.vec_v
            if v.key == key
                push!(adj, v)
            end
        end
    end
    return adj
end

function addEdge!(g::Graph, e::Edge)
    push!(g.vec_e, e)
    π = e.x # 10
    y = e.y # 9

    for v in g.vec_v 
        if v.key == π
            push!(v.adj, y)
        end

        if v.key == y
            v.π = π
        end
    end

    
end




end