// K. Выведи диапазон

func printRange(root: Node?, from: Int, to: Int) {
  guard let root = root else { return }
  
  if root.value >= from {
    printRange(root: root.left, from: from, to: to)
  }
  
  if root.value >= from && root.value <= to {
    print(root.value, terminator: " ")
  }
  
  if root.value <= to {
    printRange(root: root.right, from: from, to: to)
  }
}
