/*
 C. Нелюбимое дело
 Вася размышляет, что ему можно не делать из того списка дел, который он составил. Но, кажется, все пункты очень важные! Вася решает загадать число и удалить дело, которое идёт под этим номером. Список дел представлен в виде односвязного списка. Напишите функцию solution, которая принимает на вход голову списка и номер удаляемого дела и возвращает голову обновлённого списка.
 */

func solution(head: Node?, idx: Int) -> Node?  {
  if idx == 0 {
    // Если удаляем первый элемент, просто возвращаем следующий элемент
    return head?.next
  }

  var currentNode = head
  var currentIndex = 0

  // Находим элемент перед тем, который нужно удалить
  while currentNode != nil && currentIndex < idx - 1 {
    currentNode = currentNode?.next
    currentIndex += 1
  }

  // Если мы дошли до конца списка, или текущий элемент последний, ничего не делаем
  if currentNode == nil || currentNode?.next == nil {
    return head
  }

  // Удаляем элемент
  currentNode?.next = currentNode?.next?.next

  return head
}
