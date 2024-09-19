// F. Расстояние между вершинами

import Foundation

class Node<T> {
  var value: T
  var next: Node<T>?
  weak var previous: Node<T>?
  
  init(value: T) {
    self.value = value
  }
}

class Deque<T> {
  private var head: Node<T>?
  private var tail: Node<T>?
  private(set) var count: Int = 0
  
  var isEmpty: Bool {
    return head == nil
  }
  
  func pushFront(_ value: T) {
    let newNode = Node(value: value)
    if let headNode = head {
      newNode.next = headNode
      headNode.previous = newNode
    } else {
      tail = newNode
    }
    head = newNode
    count += 1
  }
  
  func pushBack(_ value: T) {
    let newNode = Node(value: value)
    if let tailNode = tail {
      newNode.previous = tailNode
      tailNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
    count += 1
  }
  
  func popFront() -> T? {
    guard let headNode = head else { return nil }
    let value = headNode.value
    head = headNode.next
    if head == nil {
      tail = nil
    } else {
      head?.previous = nil
    }
    count -= 1
    return value
  }
  
  func popBack() -> T? {
    guard let tailNode = tail else { return nil }
    let value = tailNode.value
    tail = tailNode.previous
    if tail == nil {
      head = nil
    } else {
      tail?.next = nil
    }
    count -= 1
    return value
  }
}

func bfs(graph: [Int: [Int]], start: Int, end: Int, n: Int) -> Int {
  if start == end {
    return 0
  }
  
  var queueStart = Deque<Int>()
  var queueEnd = Deque<Int>()
  
  var distStart = [Int](repeating: -1, count: n + 1)
  var distEnd = [Int](repeating: -1, count: n + 1)
  
  queueStart.pushBack(start)
  queueEnd.pushBack(end)
  
  distStart[start] = 0
  distEnd[end] = 0
  
  while !queueStart.isEmpty && !queueEnd.isEmpty {
    if let nodeStart = queueStart.popFront() {
      for neighbor in graph[nodeStart, default: []] {
        if distStart[neighbor] == -1 {
          distStart[neighbor] = distStart[nodeStart] + 1
          queueStart.pushBack(neighbor)
        }
        if distEnd[neighbor] != -1 {
          return distStart[neighbor] + distEnd[neighbor]
        }
      }
    }
    
    if let nodeEnd = queueEnd.popFront() {
      for neighbor in graph[nodeEnd, default: []] {
        if distEnd[neighbor] == -1 {
          distEnd[neighbor] = distEnd[nodeEnd] + 1
          queueEnd.pushBack(neighbor)
        }
        if distStart[neighbor] != -1 {
          return distStart[neighbor] + distEnd[neighbor]
        }
      }
    }
  }
  
  return -1
}

// Пример использования
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]
let m = firstLine[1]

var graph = [Int: [Int]]()

for _ in 0..<m {
  let edge = readLine()!.split(separator: " ").map { Int($0)! }
  let u = edge[0]
  let v = edge[1]
  
  graph[u, default: []].append(v)
  graph[v, default: []].append(u)
}

let lastLine = readLine()!.split(separator: " ").map { Int($0)! }
let start = lastLine[0]
let end = lastLine[1]

let result = bfs(graph: graph, start: start, end: end, n: n)
print(result)

