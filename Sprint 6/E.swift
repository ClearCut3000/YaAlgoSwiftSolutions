// E. Компоненты связности

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

// Массив для хранения посещенных вершин
var visited = Array(repeating: false, count: n + 1)

// Функция для выполнения DFS
func dfs(vertex: Int, component: inout [Int]) {
  visited[vertex] = true
  component.append(vertex)
  for neighbor in adjacencyList[vertex] {
    if !visited[neighbor] {
      dfs(vertex: neighbor, component: &component)
    }
  }
}

// Поиск всех компонент связности
var components = [[Int]]()
for vertex in 1...n {
  if !visited[vertex] {
    var component = [Int]()
    dfs(vertex: vertex, component: &component)
    component.sort() // Сортируем вершины в компоненте
    components.append(component)
  }
}

// Сортировка компонент по первой вершине
components.sort(by: { $0.first! < $1.first! })

// Вывод результата
print(components.count)
for component in components {
  print(component.map { String($0) }.joined(separator: " "))
}


