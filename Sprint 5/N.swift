// N. Разбиение дерева

func split(root: Node?, k: Int) -> (Node?, Node?) {
  guard let node = root else {
    return (nil, nil)
  }

  let leftSize = getSize(node: node.left)

  if k <= leftSize {
    // k < size of left subtree -> split in the left subtree
    let (leftPart, rightPart) = split(root: node.left, k: k)
    node.left = rightPart

    updateSize(node: node)
    return (leftPart, node)
  } else {
    // k > size of left subtree -> include this node and split in the right subtree
    let (leftPart, rightPart) = split(root: node.right, k: k - leftSize - 1)
    node.right = leftPart

    updateSize(node: node)
    return (node, rightPart)
  }
}

func updateSize(node: Node?) {
  if let node = node {
    node.size = 1 + getSize(node: node.left) + getSize(node: node.right)
  }
}

func calcSize(node: Node?) -> Int {
  if node == nil {
    return 0
  }
  return 1 + getSize(node: node!.left) + getSize(node: node!.right)
}

func getSize(node: Node?) -> Int {
  if node == nil {
    return 0
  }
  return node!.size
}
