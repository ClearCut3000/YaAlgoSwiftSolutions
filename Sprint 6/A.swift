// A. Построить список смежности

import Foundation

// Чтение данных
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]  // количество вершин
let m = firstLine[1]  // количество ребер

// Создаем список смежности
var adjacencyList = Array(repeating: [Int](), count: n)

// Чтение ребер и заполнение списка смежности
for _ in 0..<m {
  let edge = readLine()!.split(separator: " ").map { Int($0)! }
  let u = edge[0] - 1  // преобразуем из 1-индексации в 0-индексацию
  let v = edge[1] - 1  // преобразуем из 1-индексации в 0-индексацию
  adjacencyList[u].append(v + 1) // добавляем в список смежности для вершины u вершину v
}

// Форматированный вывод
for i in 0..<n {
  let edgesFromVertex = adjacencyList[i].sorted()
  print("\(edgesFromVertex.count) \(edgesFromVertex.map { String($0) }.joined(separator: " "))")
}

