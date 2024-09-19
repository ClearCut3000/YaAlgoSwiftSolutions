// H. Числовые пути

func solution(node: Node?) -> Int {
  func dfs(_ node: Node?, _ currentNumber: Int) -> Int {
    guard let node = node else { return 0 }
    
    
    let newNumber = currentNumber * 10 + node.value
    
    
    if node.left == nil && node.right == nil {
      return newNumber
    }
    
    
    let leftSum = dfs(node.left, newNumber)
    let rightSum = dfs(node.right, newNumber)
    
    
    return leftSum + rightSum
  }
  
  return dfs(node, 0)
}
