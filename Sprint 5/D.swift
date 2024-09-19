// D. Деревья - близнецы

func solution(node1: Node?, node2: Node?) -> Bool {
  // Если оба узла пустые, они идентичны
  if node1 == nil && node2 == nil {
    return true
  }
  // Если один из узлов пустой, а другой нет, они не идентичны
  if node1 == nil || node2 == nil {
    return false
  }
  // Проверяем текущие узлы и рекурсивно проверяем поддеревья
  return (node1!.value == node2!.value) &&
  solution(node1: node1!.left, node2: node2!.left) &&
  solution(node1: node1!.right, node2: node2!.right)
}
