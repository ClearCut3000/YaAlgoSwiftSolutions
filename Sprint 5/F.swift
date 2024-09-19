// F. Максимальная глубина

func solution(node: Node?) -> Int {
  // Базовый случай: если узел пустой, высота равна 0
  guard let node = node else {
    return 0
  }

  // Рекурсивно находим высоту левого и правого поддеревьев
  let leftHeight = solution(node: node.left)
  let rightHeight = solution(node: node.right)
  
  // Возвращаем максимальную высоту + 1 для текущего узла
  return max(leftHeight, rightHeight) + 1
}
