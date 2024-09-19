// E. Всё наоборот

func solution(head: Node?) -> Node? {
  var currentNode = head
  var newHead: Node? = nil

  while currentNode != nil {
    // Сохраняем текущий next узел
    let nextNode = currentNode?.next

    // Меняем местами next и prev
    currentNode?.next = currentNode?.prev
    currentNode?.prev = nextNode

    // Обновляем newHead, чтобы она указывала на текущий узел
    newHead = currentNode

    // Переходим к следующему узлу в исходном списке
    currentNode = nextNode
  }

  return newHead
}
