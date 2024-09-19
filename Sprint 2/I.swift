//  I. Ограниченная очередь

class MyQueueSized {
  private var queue: [Int] = []
  private let maxSize: Int

  init(maxSize: Int) {
    self.maxSize = maxSize
  }

  func push(_ x: Int) {
    if queue.count < maxSize {
      queue.append(x)
    } else {
      print("error")
    }
  }

  func pop() {
    if !queue.isEmpty {
      print(queue.removeFirst())
    } else {
      print("None")
    }
  }

  func peek() {
    if let firstElement = queue.first {
      print(firstElement)
    } else {
      print("None")
    }
  }

  func size() {
    print(queue.count)
  }
}

let n = Int(readLine()!)!
let maxSize = Int(readLine()!)!

let myQueue = MyQueueSized(maxSize: maxSize)

for _ in 0..<n {
  let command = readLine()!.split(separator: " ")

  switch command[0] {
  case "push":
    if let x = Int(command[1]) {
      myQueue.push(x)
    }
  case "pop":
    myQueue.pop()
  case "peek":
    myQueue.peek()
  case "size":
    myQueue.size()
  default:
    break
  }
}
