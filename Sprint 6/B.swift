// B. Перевести список ребер в матрицу смежности

import Foundation

// Чтение данных
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]  // количество вершин
let m = firstLine[1]  // количество рёбер

// Инициализация матрицы смежности размером n x n, заполненной нулями
var adjacencyMatrix = Array(repeating: Array(repeating: 0, count: n), count: n)

// Чтение рёбер и заполнение матрицы смежности
for _ in 0..<m {
  let edge = readLine()!.split(separator: " ").map { Int($0)! }
  let u = edge[0] - 1  // вершина u (1-индексация к 0-индексации)
  let v = edge[1] - 1  // вершина v (1-индексация к 0-индексации)
  adjacencyMatrix[u][v] = 1  // устанавливаем единицу, если есть ребро из u в v
}

// Вывод матрицы смежности
for row in adjacencyMatrix {
  print(row.map { String($0) }.joined(separator: " "))
}
