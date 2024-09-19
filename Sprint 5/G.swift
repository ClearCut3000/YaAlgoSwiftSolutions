// G. Максимальный путь в дереве

func solution(node: Node?) -> Int {
  var maxSum = Int.min
  
  func maxGain(_ node: Node?) -> Int {
    guard let node = node else { return 0 }
    
    // Рекурсивно получаем максимальную сумму пути для левого и правого поддеревьев
    let leftGain = max(maxGain(node.left), 0)
    let rightGain = max(maxGain(node.right), 0)
    
    // Текущая сумма пути, проходящая через текущий узел
    let currentPathSum = node.value + leftGain + rightGain
    
    // Обновляем глобальный максимум
    maxSum = max(maxSum, currentPathSum)
    
    // Возвращаем максимальную сумму пути, заканчивающуюся на текущем узле
    return node.value + max(leftGain, rightGain)
  }
  
  _ = maxGain(node)
  return maxSum
}
