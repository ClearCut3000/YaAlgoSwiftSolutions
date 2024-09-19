// H. Время выходить

import Foundation

// Функция для чтения данных из stdin
func readIntArray() -> [Int] {
  return readLine()!.split(separator: " ").map { Int($0)! }
}

// Глобальные переменные
var adjList: [[Int]] = []
var tin: [Int] = []
var tout: [Int] = []
var visited: [Bool] = []
var timer = 0

// Функция DFS для обхода графа
func dfs(v: Int) {
  visited[v] = true
  tin[v] = timer
  timer += 1
  
  for neighbor in adjList[v] {
    if !visited[neighbor] {
      dfs(v: neighbor)
    }
  }
  
  tout[v] = timer
  timer += 1
}

func main() {
  let nm = readIntArray()
  let n = nm[0]
  let m = nm[1]
  
  // Инициализация списков смежности, времени входа/выхода и visited
  adjList = Array(repeating: [], count: n + 1)
  tin = Array(repeating: 0, count: n + 1)
  tout = Array(repeating: 0, count: n + 1)
  visited = Array(repeating: false, count: n + 1)
  
  // Чтение рёбер и построение графа
  for _ in 0..<m {
    let edge = readIntArray()
    let from = edge[0]
    let to = edge[1]
    adjList[from].append(to)
  }
  
  // Сортировка смежных вершин для каждой вершины по возрастанию номеров
  for i in 1...n {
    adjList[i].sort()
  }
  
  // Запуск DFS из вершины 1
  dfs(v: 1)
  
  // Вывод результатов
  for i in 1...n {
    print("\(tin[i]) \(tout[i])")
  }
}

main()

