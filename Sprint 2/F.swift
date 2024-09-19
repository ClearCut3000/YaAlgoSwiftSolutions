// F. Стек - Max

class StackMax {
  private var stack: [Int] = []
  private var maxStack: [Int] = []

  func push(_ x: Int) {
    stack.append(x)
    if let maxElement = maxStack.last {
      maxStack.append(max(x, maxElement))
    } else {
      maxStack.append(x)
    }
  }

  func pop() -> String {
    if stack.isEmpty {
      return "error"
    } else {
      stack.removeLast()
      maxStack.removeLast()
      return ""
    }
  }

  func get_max() -> String {
    if let maxElement = maxStack.last {
      return "\(maxElement)"
    } else {
      return "None"
    }
  }
}

let n = Int(readLine()!)!

let stackMax = StackMax()

for _ in 0..<n {
  let command = readLine()!.split(separator: " ")

  switch command[0] {
  case "push":
    if let x = Int(command[1]) {
      stackMax.push(x)
    }
  case "pop":
    let result = stackMax.pop()
    if result == "error" {
      print(result)
    }
  case "get_max":
    print(stackMax.get_max())
  default:
    break
  }
}
