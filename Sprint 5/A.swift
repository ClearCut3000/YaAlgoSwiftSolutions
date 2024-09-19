// A. Лампочки

func solution(node: Node?) -> Int {
  // Если узел пустой, возвращаем минимальное значение Int (чтобы не повлиять на поиск максимального значения)
  guard let node = node else {
    return Int.min
  }
  
  // Ищем максимальное значение в левом и правом поддеревьях
  let leftMax = solution(node: node.left)
  let rightMax = solution(node: node.right)
  
  // Возвращаем максимальное значение среди текущего узла, левого и правого поддерева
  return max(node.value, leftMax, rightMax)
}
