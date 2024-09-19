// G. Максимальное расстояние

class Queue<T> {
  private var queue: [T?]
  private var head: Int
  private var tail: Int
  private var maxN: Int
  private var size: Int
  
  init(n: Int) {
    queue = [T?](repeating: nil, count: n)
    head = 0
    tail = 0
    maxN = n
    size = 0
  }
  
  func isEmpty() -> Bool {
    return size == 0
  }
  
  func enqueue(_ x: T) {
    if size != maxN {
      queue[tail] = x
      tail = (tail + 1) % maxN
      size += 1
    }
  }
  
  func dequeue() -> T? {
    if isEmpty() {
      return nil
    }
    let x = queue[head]
    queue[head] = nil
    head = (head + 1) % maxN
    size -= 1
    return x
  }
}

func bfs(_ startVertex: Int, _ outgoingEdges: (Int) -> [Int], n: Int) -> Int {
  var color = [String](repeating: "white", count: n + 1)
  var previous = [Int](repeating: -1, count: n + 1)
  var distance = [Int](repeating: -1, count: n + 1)
  
  var planned = Queue<Int>(n: n)
  planned.enqueue(startVertex)
  color[startVertex] = "gray"
  distance[startVertex] = 0
  
  var maxDistance = 0
  
  while !planned.isEmpty() {
    guard let u = planned.dequeue() else { break }
    
    for v in outgoingEdges(u) {
      if color[v] == "white" {
        distance[v] = distance[u] + 1
        previous[v] = u
        color[v] = "gray"
        planned.enqueue(v)
        maxDistance = max(maxDistance, distance[v])
      }
    }
    color[u] = "black"
  }
  
  return maxDistance
}

func shortestPath(_ v: Int, previous: [Int]) -> [Int] {
  var path = [Int]()
  var currentVertex = v
  
  while currentVertex != -1 {
    path.append(currentVertex)
    currentVertex = previous[currentVertex]
  }
  
  return path.reversed()
}

// Пример использования
func main() {
  // Входные данные
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
  
  let startVertex = Int(readLine()!)!
  
  // Используем BFS для нахождения максимального расстояния
  let maxDistance = bfs(startVertex, { graph[$0] ?? [] }, n: n)
  print(maxDistance)
}

main()


