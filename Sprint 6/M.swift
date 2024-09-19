// M. Проверка на двудольность

import Foundation

// Function to check if the graph is bipartite
func isBipartite(n: Int, edges: [(Int, Int)]) -> String {
  // Initialize adjacency list
  var graph = [[Int]](repeating: [], count: n)
  for edge in edges {
    let (u, v) = edge
    graph[u - 1].append(v - 1)
    graph[v - 1].append(u - 1)
  }

  // Initialize the part array with -1
  var part = [Int](repeating: -1, count: n)
  var ok = true

  // BFS to check bipartiteness
  for st in 0..<n {
    if part[st] == -1 {
      var queue = [Int]()
      queue.append(st)
      part[st] = 0

      var head = 0

      while head < queue.count {
        let v = queue[head]
        head += 1

        for to in graph[v] {
          if part[to] == -1 {
            part[to] = 1 - part[v]
            queue.append(to)
          } else if part[to] == part[v] {
            ok = false
          }
        }
      }
    }
  }

  return ok ? "YES" : "NO"
}

// Reading input and processing
func readInput() -> (Int, [(Int, Int)]) {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let m = firstLine[1]

  var edges = [(Int, Int)]()
  for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append((edge[0], edge[1]))
  }

  return (n, edges)
}

// Main function
let (n, edges) = readInput()
print(isBipartite(n: n, edges: edges))
