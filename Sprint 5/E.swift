// E. Дерево поиска

func solution(node: Node?) -> Bool {
  return isValidBST(node, min: nil, max: nil)
}

private func isValidBST(_ node: Node?, min: Int?, max: Int?) -> Bool {
  // Пустое дерево является деревом поиска
  if node == nil {
    return true
  }
  
  // Проверяем текущее значение узла
  if let min = min, node!.value <= min {
    return false
  }
  if let max = max, node!.value >= max {
    return false
  }
  
  // Рекурсивно проверяем левое и правое поддеревья
  return isValidBST(node!.left, min: min, max: node!.value) && isValidBST(node!.right, min: node!.value, max: max)
}
