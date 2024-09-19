// G. Стек - MaxEffective

class StackMaxEffective {
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

  func top() -> String {
    if let topElement = stack.last {
      return "\(topElement)"
    } else {
      return "error"
    }
  }
}


let n = Int(readLine()!)!

let stackMaxEffective = StackMaxEffective()

for _ in 0..<n {
  let command = readLine()!.split(separator: " ")

  switch command[0] {
  case "push":
    if let x = Int(command[1]) {
      stackMaxEffective.push(x)
    }
  case "pop":
    let result = stackMaxEffective.pop()
    if result == "error" {
      print(result)
    }
  case "get_max":
    print(stackMaxEffective.get_max())
  case "top":
    print(stackMaxEffective.top())
  default:
    break
  }
}
