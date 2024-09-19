// B. Сбалансированное дерево

func solution(node: Node?) -> Bool {
  // Вспомогательная функция, которая возвращает кортеж (сбалансировано ли поддерево, высота поддерева)
  func checkBalance(_ node: Node?) -> (isBalanced: Bool, height: Int) {
    // Пустое дерево считается сбалансированным и имеет высоту 0
    guard let node = node else {
      return (true, 0)
    }
    
    // Рекурсивно проверяем левое и правое поддеревья
    let left = checkBalance(node.left)
    let right = checkBalance(node.right)
    
    // Дерево сбалансировано, если оба поддерева сбалансированы и разница в их высоте не больше 1
    let isBalanced = left.isBalanced && right.isBalanced && abs(left.height - right.height) <= 1
    // Высота текущего узла - это 1 плюс максимальная высота его поддеревьев
    let height = 1 + max(left.height, right.height)
    
    return (isBalanced, height)
  }
  
  // Начинаем проверку с корневого узла
  return checkBalance(node).isBalanced
}
