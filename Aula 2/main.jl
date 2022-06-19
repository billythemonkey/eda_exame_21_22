include("../modulos/MyQueue.jl")
using .MyQueue
import .Queue.enqueue!, .Queue.dequeue!


function main()
    N = 10
    q = MyQueue.Queue(N)
    println(q)
end

main()