// J. Добавь узел

func insert(root: Node?, newValue: Int) -> Node {
  guard let root = root else { return Node(newValue) }

  if newValue < root.value {
    root.left = insert(root: root.left, newValue: newValue)
  } else {
    root.right = insert(root: root.right, newValue: newValue)
  }

  return root
}
