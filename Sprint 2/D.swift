// D. Заботливая мама

func solution(head: Node?, elem: String) -> Int {
  var currentNode = head
  var index = 0
  
  while currentNode != nil {
    if currentNode!.value == elem {
      return index
    }
    currentNode = currentNode!.next
    index += 1
  }
  
  return -1
}
