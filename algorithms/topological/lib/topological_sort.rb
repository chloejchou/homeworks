require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  queue = []
  in_edge_counts = {}

  vertices.each do |vertex|
    queue << vertex if vertex.in_edges.empty?
    in_edge_counts[vertex] = vertex.in_edges.count
  end

  until queue.empty?
    current_vertex = queue.shift
    sorted << current_vertex
    current_vertex.out_edges.each do |out_edge|
      to_vertex = out_edge.to_vertex
      in_edge_counts[to_vertex] -= 1
      queue << to_vertex if in_edge_counts[to_vertex] == 0
    end
  end

  sorted
end
