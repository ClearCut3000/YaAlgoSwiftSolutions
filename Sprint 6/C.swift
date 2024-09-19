// C. DFS

import Foundation

// Чтение данных
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]  // количество вершин
let m = firstLine[1]  // количество рёбер

// Инициализация списка смежности
var adjacencyList = Array(repeating: [Int](), count: n + 1)

// Чтение рёбер и заполнение списка смежности
for _ in 0..<m {
  let edge = readLine()!.split(separator: " ").map { Int($0)! }
  let u = edge[0]
  let v = edge[1]
  adjacencyList[u].append(v)
  adjacencyList[v].append(u)
}

// Чтение стартовой вершины
let startVertex = Int(readLine()!)!

// Сортировка списка смежности для каждой вершины
for i in 1...n {
  adjacencyList[i].sort()
}

// Массив для хранения посещенных вершин
var visited = Array(repeating: false, count: n + 1)

// Рекурсивная функция DFS
func dfs(vertex: Int) {
  visited[vertex] = true
  print(vertex, terminator: " ")
  
  for neighbor in adjacencyList[vertex] {
    if !visited[neighbor] {
      dfs(vertex: neighbor)
    }
  }
}

// Запуск DFS от стартовой вершины
dfs(vertex: startVertex)

