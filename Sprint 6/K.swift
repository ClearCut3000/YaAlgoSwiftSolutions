// K. Достопримечательности

import Foundation

// Структура ребра
struct Edge {
  let u: Int
  let v: Int
  let weight: Int
}

// Граф
class Graph {
  let vertices: [Int]
  private var adjList: [[(Int, Int)]]

  init(vertices: [Int], edges: [Edge]) {
    self.vertices = vertices
    self.adjList = Array(repeating: [], count: vertices.count)
    for edge in edges {
      adjList[edge.u - 1].append((edge.v - 1, edge.weight))
      adjList[edge.v - 1].append((edge.u - 1, edge.weight))
    }
  }

  func outgoingEdges(_ u: Int) -> [(Int, Int)] {
    return adjList[u]
  }
}

var dist: [Int]!
var previous: [Int]!
var visited: [Bool]!

func relax(u: Int, v: Int, weight: Int) {
  if dist[v] > dist[u] + weight {
    dist[v] = dist[u] + weight
    previous[v] = u
  }
}

func getMinDistNotVisitedVertex() -> Int {
  var currentMinimum = Int.max
  var currentMinimumVertex = -1

  for v in 0..<dist.count {
    if !visited[v] && dist[v] < currentMinimum {
      currentMinimum = dist[v]
      currentMinimumVertex = v
    }
  }

  return currentMinimumVertex
}

func dijkstra(graph: Graph, s: Int) {
  let n = graph.vertices.count
  dist = Array(repeating: Int.max, count: n)
  previous = Array(repeating: -1, count: n)
  visited = Array(repeating: false, count: n)

  dist[s] = 0

  while true {
    let u = getMinDistNotVisitedVertex()

    if u == -1 || dist[u] == Int.max {
      break
    }

    visited[u] = true
    let neighbours = graph.outgoingEdges(u)

    for (v, weight) in neighbours {
      relax(u: u, v: v, weight: weight)
    }
  }
}

func main() {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let n = input[0]
  let m = input[1]

  var edges = [Edge]()
  for _ in 0..<m {
    let edgeData = readLine()!.split(separator: " ").map { Int($0)! }
    edges.append(Edge(u: edgeData[0], v: edgeData[1], weight: edgeData[2]))
  }

  let graph = Graph(vertices: Array(1...n), edges: edges)

  // Матрица расстояний
  var distanceMatrix = Array(repeating: Array(repeating: Int.max, count: n), count: n)

  for i in 0..<n {
    dijkstra(graph: graph, s: i)
    for j in 0..<n {
      if dist[j] == Int.max {
        distanceMatrix[i][j] = -1
      } else {
        distanceMatrix[i][j] = dist[j]
      }
    }
  }

  // Выводим матрицу
  for row in distanceMatrix {
    print(row.map { $0 == Int.max ? -1 : $0 }.map { String($0) }.joined(separator: " "))
  }
}

main()


