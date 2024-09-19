// O. Количество путей

import Foundation

let MOD = 1_000_000_007

func countPaths(n: Int, edges: [(Int, Int)], A: Int, B: Int) -> Int {
  var adjList = Array(repeating: [Int](), count: n + 1)
  var inDegree = Array(repeating: 0, count: n + 1)

  // Строим граф
  for (u, v) in edges {
    adjList[u].append(v)
    inDegree[v] += 1
  }

  // Топологическая сортировка
  var topoSort = [Int]()
  var queue = [Int]()

  for i in 1...n {
    if inDegree[i] == 0 {
      queue.append(i)
    }
  }

  while !queue.isEmpty {
    let u = queue.removeFirst()
    topoSort.append(u)

    for v in adjList[u] {
      inDegree[v] -= 1
      if inDegree[v] == 0 {
        queue.append(v)
      }
    }
  }

  // Динамическое программирование для подсчета путей
  var dp = Array(repeating: 0, count: n + 1)
  dp[A] = 1

  for u in topoSort {
    for v in adjList[u] {
      dp[v] = (dp[v] + dp[u]) % MOD
    }
  }

  return dp[B]
}

if let firstLine = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
  let n = firstLine[0]
  let m = firstLine[1]

  var edges = [(Int, Int)]()

  for _ in 0..<m {
    if let edge = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
      edges.append((edge[0], edge[1]))
    }
  }

  if let lastLine = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
    let A = lastLine[0]
    let B = lastLine[1]

    let result = countPaths(n: n, edges: edges, A: A, B: B)
    print(result)
  }
}
