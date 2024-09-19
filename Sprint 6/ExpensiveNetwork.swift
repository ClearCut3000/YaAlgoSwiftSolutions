//
//  ExpensiveNetwork.swift
//
/*
 -- ПРИНЦИП РАБОТЫ --
 Алгоритм реализует нахождение максимального остовного дерева в неориентированном графе с использованием алгоритма Крускала и структуры данных DSU (система непересекающихся множеств) с сжатием пути и ранговой эвристикой.
 Алгоритм Крускала сортирует рёбра графа по убыванию весов и последовательно добавляет их в остовное дерево, если добавление ребра не создаёт цикла, используя DSU для проверки и объединения компонент связности.
 Если удаётся объединить все вершины графа в одно дерево, возвращается суммарный вес максимального остовного дерева. В противном случае, если граф несвязный, алгоритм сообщает, что построить остовное дерево невозможно.

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм Крускала корректен, так как на каждом шаге добавляется самое тяжёлое ребро, не создающее цикл, что гарантирует построение максимального остовного дерева.
 Использование DSU позволяет эффективно проверять, принадлежат ли вершины одного ребра к одной компоненте связности, и объединять компоненты при добавлении ребра.
 Сжатие пути и ранговая эвристика в DSU минимизируют глубину дерева поиска, что ускоряет операции объединения и поиска.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Временная сложность алгоритма Крускала с использованием DSU составляет O(m log n), где m — количество рёбер, а n — количество вершин в графе.
 Основная сложность связана с сортировкой рёбер (O(m log m)) и выполнением операций find и union в DSU, каждая из которых выполняется за почти константное время, близкое к O(α(n)), где α(n) — обратная функция Аккермана, очень медленно растущая.
 В целом, сложность можно записать как O(m log m), так как сортировка доминирует в асимптотике. 
 Идея взята из http://www.e-maxx-ru.1gb.ru/algo/mst_kruskal_with_dsu

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность алгоритма определяется хранением массива рёбер и структур данных для DSU. Она составляет O(n + m), где n — количество вершин (для хранения родительских и ранговых массивов в DSU), а m — количество рёбер (для хранения рёбер графа).
 Пространственная сложность может считаться оптимальной для решения данной задачи, так как она линейно зависит от входных данных.
 */

import Foundation

// Протокол для описания графа
protocol Graph {
  var verticesCount: Int { get }
  var edges: [Edge] { get }
}

// Протокол для описания ребра
protocol Edge {
  var u: Int { get }
  var v: Int { get }
  var weight: Int { get }
}

// Реализация конкретного ребра
struct GraphEdge: Edge {
  let u: Int
  let v: Int
  let weight: Int
}

// Реализация конкретного графа
struct SimpleGraph: Graph {
  let verticesCount: Int
  let edges: [Edge]
}

// Интерфейс для системы непересекающихся множеств (DSU)
protocol DisjointSetUnion {
  func find(_ element: Int) -> Int
  func union(_ first: Int, _ second: Int)
}

// Конкретная реализация DSU с ранговой эвристикой и сжатием пути
class RankBasedDSU: DisjointSetUnion {
  private var parent: [Int]
  private var rank: [Int]

  init(size: Int) {
    parent = Array(0..<size)
    rank = Array(repeating: 0, count: size)
  }

  func find(_ element: Int) -> Int {
    if element != parent[element] {
      parent[element] = find(parent[element])
    }
    return parent[element]
  }

  func union(_ first: Int, _ second: Int) {
    let rootFirst = find(first)
    let rootSecond = find(second)

    if rootFirst != rootSecond {
      if rank[rootFirst] < rank[rootSecond] {
        parent[rootFirst] = rootSecond
      } else if rank[rootFirst] > rank[rootSecond] {
        parent[rootSecond] = rootFirst
      } else {
        parent[rootSecond] = rootFirst
        rank[rootFirst] += 1
      }
    }
  }
}

// Класс, реализующий алгоритм Крускала
class KruskalAlgorithm {
  private let graph: Graph
  private let dsu: DisjointSetUnion

  init(graph: Graph, dsu: DisjointSetUnion) {
    self.graph = graph
    self.dsu = dsu
  }

  func findMaximumSpanningTree() -> Int? {
    let sortedEdges = graph.edges.sorted { $0.weight > $1.weight }
    var maxSpanningTreeWeight = 0
    var edgesUsed = 0

    for edge in sortedEdges {
      if dsu.find(edge.u) != dsu.find(edge.v) {
        dsu.union(edge.u, edge.v)
        maxSpanningTreeWeight += edge.weight
        edgesUsed += 1
      }
    }

    return edgesUsed == graph.verticesCount - 1 ? maxSpanningTreeWeight : nil
  }
}

// Использование всех компонентов вместе
func solve() {
  let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
  let n = firstLine[0]
  let m = firstLine[1]

  var edges = [Edge]()

  for _ in 0..<m {
    let edgeData = readLine()!.split(separator: " ").map { Int($0)! }
    let u = edgeData[0] - 1
    let v = edgeData[1] - 1
    let weight = edgeData[2]
    edges.append(GraphEdge(u: u, v: v, weight: weight))
  }

  let graph = SimpleGraph(verticesCount: n, edges: edges)
  let dsu = RankBasedDSU(size: n)
  let kruskal = KruskalAlgorithm(graph: graph, dsu: dsu)

  if let result = kruskal.findMaximumSpanningTree() {
    print(result)
  } else {
    print("Oops! I did it again")
  }
}

solve()
