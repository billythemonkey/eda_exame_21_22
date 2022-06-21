import Cairo 
using Graphs, GraphPlot, SimpleWeightedGraphs, Plots 
 
#=G = path_graph(6) 
 
nv(G) 
 
ne(G) 
 
gplot(G, nodelabel = 1:nv(G))=# 
 
G1 = Graph(3) # graph with 3 vertices 
 
# make a triangle 
add_edge!(G1, 1, 2) 
add_edge!(G1, 1, 3) 
add_edge!(G1, 2, 3) 
 
#gplot(G1, nodelabel=1:nv(G1)) 
 
 A = [ 
     0 1 1 
     1 0 1 
     1 1 0 
 ] 
 
G2 = Graph(A) 
 
 
 
#gplot(G2, nodelabel=1:nv(G2)) 
 
#add_edge!(G2, 1, 3) 
 
G3 = SimpleWeightedGraph(3)  # or use SimpleWeightedDiGraph for directed graphs 
add_edge!(G3, 1, 2, 0.5) 
add_edge!(G3, 2, 3, 0.8) 
add_edge!(G3, 1, 3, 2.0) 
 
# get weight of edge from vertex 1 to vertex 2 
#get_weight(G3, 1, 2) 
 
 
gplot(G3, nodelabel=1:nv(G3)) 
 
# find the shortest path from vertex 1 to vertex 3 taking weights into account. 
#enumerate_paths(dijkstra_shortest_paths(G3, 1), 3) 
 
# reweight the edge from 1 to 2 
#add_edge!(G3, 1, 2, 1.6) 
 
# rerun the shortest path calculation from 1 to 3 
#enumerate_paths(dijkstra_shortest_paths(G3, 1), nv(G3))