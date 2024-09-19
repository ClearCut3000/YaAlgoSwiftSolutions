// L. Полный граф

import Foundation

struct Edge: Hashable {
  let u: Int
  let v: Int

  init(_ u: Int, _ v: Int) {
    if u < v {
      self.u = u
      self.v = v
    } else {
      self.u = v
      self.v = u
    }
  }
}

func isCompleteGraph(n: Int, m: Int, edges: [(Int, Int)]) -> String {
  let expectedEdges = (n * (n - 1)) / 2

  // Множество для хранения рёбер
  var edgeSet = Set<Edge>()

  for (u, v) in edges {
    if !edgeSet.contains(Edge(v, u)) && v != u {
      edgeSet.insert(Edge(u, v))
    }
  }

  // Проверяем, что количество уникальных рёбер соответствует ожидаемому
  if edgeSet.count == expectedEdges {
    return "YES"
  } else {
    return "NO"
  }
}

// Чтение данных
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let m = firstLine[1]

var edges = [(Int, Int)]()

for _ in 0..<m {
  let edge = readLine()!.split(separator: " ").map { Int($0)! }
  edges.append((edge[0], edge[1]))
}

// Вывод результата
print(isCompleteGraph(n: n, m: m, edges: edges))

