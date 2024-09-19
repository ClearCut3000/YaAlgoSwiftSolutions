/*
 B. Список дел
 Васе нужно распечатать свой список дел на сегодня. Помогите ему: напишите функцию, которая печатает все его дела. Известно, что дел у Васи не больше 5000.
 */

func solution(head: Node?) {
  var currentNode = head
  while let node = currentNode {
    print(node.value)
    currentNode = node.next
  }
}
