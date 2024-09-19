// C. Дерево - анаграмма

func solution(node: Node?) -> Bool {
  // Вспомогательная функция для проверки симметричности двух поддеревьев
  func isMirror(_ left: Node?, _ right: Node?) -> Bool {
    // Оба поддерева пустые - симметричны
    if left == nil && right == nil {
      return true
    }
    // Одно из поддеревьев пустое, другое не пустое - несимметрично
    if left == nil || right == nil {
      return false
    }
    // Проверяем текущие узлы и рекурсивно проверяем поддеревья
    return (left!.value == right!.value) &&
    isMirror(left!.left, right!.right) &&
    isMirror(left!.right, right!.left)
  }
  
  // Начинаем проверку симметричности с корневого узла
  return isMirror(node?.left, node?.right)
}
