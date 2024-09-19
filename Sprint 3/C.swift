//  C. Подпоследовательность

func isSubsequence(_ s: String, _ t: String) -> Bool {
  guard !s.isEmpty || !t.isEmpty else { return true }
  
  var stack = [Character]()
  
  for char in s.reversed() {
    stack.append(char)
  }
  for char in t {
    if let lastChar = stack.last, lastChar == char {
      stack.removeLast()
    }
    
    
    if stack.isEmpty {
      return true
    }
  }
  
  return false
}

let s = readLine()!
let t = readLine()!
isSubsequence(s, t) ? print("True") : print("False")
