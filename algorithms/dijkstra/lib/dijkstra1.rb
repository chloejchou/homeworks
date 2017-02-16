require_relative 'graph'

# O(|V|**2 + |E|).
def dijkstra1(source)
  possible_paths = {
    source => { weight: 0, prev: nil }
  }
  visited_paths = {}

  until possible_paths.empty?
    vertex = select_path(possible_paths)

    visited_paths[vertex] = possible_paths[vertex]
    possible_paths.delete(vertex)

    update_paths(vertex, visited_paths, possible_paths)
  end

  visited_paths
end

def select_path(possible_paths)
  vertex, data = possible_paths.min_by do |(vertex, data)|
    data[:weight]
  end

  vertex
end

def update_paths(vertex, visited_paths, possible_paths)
  path_to_vertex_cost = visited_paths[vertex][:weight]
  vertex.out_edges.each do |e|
    to_vertex = e.to_vertex
    next if visited_paths.has_key?(to_vertex)
    extended_path_cost = path_to_vertex_cost + e.cost
    next if possible_paths.has_key?(to_vertex) &&
            possible_paths[to_vertex][:weight] <= extended_path_cost
    possible_paths[to_vertex] = {
      weight: extended_path_cost,
      prev: e
    }
  end
end
