// A. Генератор скобок

func generateParenthesis(_ n: Int) -> [String] {
  var result: [String] = []
  
  func backtrack(_ current: String, _ openCount: Int, _ closeCount: Int) {
    if current.count == 2 * n {
      result.append(current)
      return
    }
    
    if openCount < n {
      backtrack(current + "(", openCount + 1, closeCount)
    }
    
    if closeCount < openCount {
      backtrack(current + ")", openCount, closeCount + 1)
    }
  }
  
  backtrack("", 0, 0)
  return result
}

let n = Int(readLine()!)!
let combinations = generateParenthesis(n)
print(combinations.joined(separator: "\n"))
