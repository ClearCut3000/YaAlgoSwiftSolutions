// J. Топологическая сортировка

import Foundation

// Функция для чтения данных из stdin
func readInt() -> Int {
  return Int(readLine()!)!
}

func readIntArray() -> [Int] {
  return readLine()!.split(separator: " ").map { Int($0)! }
}

// Глобальные переменные для работы алгоритма
var order: [Int] = []
var color: [String] = []
var adjList: [[Int]] = []

// Функция DFS для топологической сортировки
func topSort(_ v: Int) {
  color[v] = "gray"
  for w in adjList[v] {
    if color[w] == "white" {
      topSort(w)
    }
  }
  color[v] = "black"
  order.append(v)
}

// Функция запуска топологической сортировки для всех вершин
func mainTopSort(n: Int) {
  for i in 0..<n {
    if color[i] == "white" {
      topSort(i)
    }
  }
}

func main() {
  let nm = readIntArray()
  let n = nm[0]
  let m = nm[1]

  // Инициализация списка смежности и цвета вершин
  adjList = Array(repeating: [], count: n)
  color = Array(repeating: "white", count: n)

  // Чтение рёбер и построение графа
  for _ in 0..<m {
    let edge = readIntArray()
    let from = edge[0] - 1
    let to = edge[1] - 1
    adjList[from].append(to)
  }

  // Запуск топологической сортировки
  mainTopSort(n: n)

  // Вывод результата в обратном порядке
  print(order.reversed().map { String($0 + 1) }.joined(separator: " "))
}

main()



