=begin
1129. Shortest Path with Alternating Colors
Medium

Consider a directed graph, with nodes labelled 0, 1, ..., n-1.  In this graph, each edge is either red or blue, and there could be self-edges or parallel edges.

Each [i, j] in red_edges denotes a red directed edge from node i to node j.  Similarly, each [i, j] in blue_edges denotes a blue directed edge from node i to node j.

Return an array answer of length n, where each answer[X] is the length of the shortest path from node 0 to node X such that the edge colors alternate along the path (or -1 if such a path doesn't exist).

 

Example 1:

Input: n = 3, red_edges = [[0,1],[1,2]], blue_edges = []
Output: [0,1,-1]

Example 2:

Input: n = 3, red_edges = [[0,1]], blue_edges = [[2,1]]
Output: [0,1,-1]

Example 3:

Input: n = 3, red_edges = [[1,0]], blue_edges = [[2,1]]
Output: [0,-1,-1]

Example 4:

Input: n = 3, red_edges = [[0,1]], blue_edges = [[1,2]]
Output: [0,1,2]

Example 5:

Input: n = 3, red_edges = [[0,1],[0,2]], blue_edges = [[1,0]]
Output: [0,1,1]

 

Constraints:

    1 <= n <= 100
    red_edges.length <= 400
    blue_edges.length <= 400
    red_edges[i].length == blue_edges[i].length == 2
    0 <= red_edges[i][j], blue_edges[i][j] < n    
    
=end

require 'set'
RED=0
BLUE=1

# @param {Integer} n
# @param {Integer[][]} red_edges
# @param {Integer[][]} blue_edges
# @return {Integer[]}
def shortest_alternating_paths(n, red_edges, blue_edges)
    red_edges_hash={}
    blue_edges_hash={}
    
    red_edges.each{ |edge|
    	origen, destino = edge
    	red_edges_hash[origen]=[] if red_edges_hash[origen].nil?
    	red_edges_hash[origen].push(destino)
    }
    blue_edges.each{ |edge|
    	origen, destino = edge
    	blue_edges_hash[origen]=[] if blue_edges_hash[origen].nil?
    	blue_edges_hash[origen].push(destino)
    }
   distances= Array.new(n)
   distances.fill(-1)
   
   
   visited = Set[]
   visited.add([0,RED])
   visited.add([0,BLUE])
   
   queue=[]
   queue.push([0,RED,0])
   queue.push([0,BLUE,0])
   while(!queue.empty?)
   	node, color, length = queue.shift()
   	if(distances[node]==-1)
   		distances[node]=length
   	else
   		distances[node]= [distances[node], length].min
   	end
    #Add nodes in oposite color
    if(color==RED)
    	if(!blue_edges_hash[node].nil?)
    		blue_edges_hash[node].each{ |child|
    			#Avoid loops by marking nodes as visited
    			if(!visited.include?([child,BLUE])) 
    				visited.add([child,BLUE])
    				queue.push([child, BLUE,length+1])
    			end
    		}
    	end
    elsif(color==BLUE)
    	if(!red_edges_hash[node].nil?)
    		red_edges_hash[node].each{ |child|
    			#Avoid loops by marking nodes as visited
    			if(!visited.include?([child,RED])) 
    				visited.add([child,RED])
    				queue.push([child, RED, length+1])
    			end
    		}
    	end
    end   
   end
   
   return distances
end

puts shortest_alternating_paths(3,  [[0,1],[1,2]], [[1,2]]).to_s
