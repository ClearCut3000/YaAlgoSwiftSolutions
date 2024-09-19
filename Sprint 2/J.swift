// J. Списочная очередь

class Node {
  var value: Int
  var next: Node?

  init(_ value: Int) {
    self.value = value
    self.next = nil
  }
}

class MyQueueLinkedList {
  private var head: Node?
  private var tail: Node?
  private var currentSize: Int = 0

  func put(_ x: Int) {
    let newNode = Node(x)
    if let tailNode = tail {
      tailNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
    currentSize += 1
  }

  func get() -> String {
    if let headNode = head {
      head = headNode.next
      if head == nil {
        tail = nil
      }
      currentSize -= 1
      return "\(headNode.value)"
    } else {
      return "error"
    }
  }

  func size() -> Int {
    return currentSize
  }
}

let n = Int(readLine()!)!

let myQueue = MyQueueLinkedList()

for _ in 0..<n {
  let command = readLine()!.split(separator: " ")
  
  switch command[0] {
  case "put":
    if let x = Int(command[1]) {
      myQueue.put(x)
    }
  case "get":
    print(myQueue.get())
  case "size":
    print(myQueue.size())
  default:
    break
  }
}
