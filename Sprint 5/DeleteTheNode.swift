
  DeleteTheNode.swift

/*
 -- ПРИНЦИП РАБОТЫ --
 Алгоритм удаления узла из бинарного дерева поиска (BST) основывается на рекурсивном поиске и обработке узла, который необходимо удалить.
 В зависимости от количества детей у удаляемого узла, алгоритм обрабатывает три случая:
 1. Если удаляемый узел не имеет детей (лист), он просто удаляется.
 2. Если удаляемый узел имеет одного ребёнка, он заменяется этим ребёнком.
 3. Если удаляемый узел имеет двух детей, он заменяется на наименьший узел в его правом поддереве, который затем удаляется из правого поддерева.
 После каждой операции удаления или замены происходит обновление размеров поддеревьев, чтобы информация о размерах оставалась корректной.

 +---------------------+
 |   remove(root, key) |
 +------------+--------+
              |
              v
 +-------------------------------+
 |  root == nil ? return nil     |
 +-------------------------------+
              |
              v
 +-------------------------------------+
 | key < root.value ?                  |
 | root.left = remove(root.left, key)  |
 | return root                         |
 +-------------------------------------+
              |
              v
 +-------------------------------------+
 | key > root.value ?                  |
 | root.right = remove(root.right, key)|
 | return root                         |
 +-------------------------------------+
              |
              v
 +--------------------------------------+
 | key == root.value ?                  |
 | (three cases below)                  |
 +--------------------------------------+
              |
              v
 +----------------------------+       +--------------------------------+              +-----------------------------------------------+
 | Case 1: Leaf Node          |       | Case 2: One Child              |              | Case 3: Two Children                          |
 +----------------------------+       +--------------------------------+              +-----------------------------------------------+
 | root.left == nil           |       | root.left == nil               |              | Find min in right subtree                     |
 | root.right == nil          |       | or root.right == nil           |              | (minNode)                                     |
 | return nil                 |       | return the non-nil child       |              +-----------------------------------------------+
 +----------------------------+       +--------------------------------+              | Replace root.value with                       |
              |                                       |                               | minNode.value                                 |
              |                                       |                               | root.right = remove(root.right, minNode.value)|
              |                                       |                               +-----------------------------------------------+
              |                                       |                                                     |
              |                                       |                                                     |
              |                                       |                                                     |
              |                                       |                                                     |
              v                                       v                                                     v
 +------------------------------------------------------------------------------------------------------------------------------------+
 |                              Update Sizes: recalculate the size of each subtree                                                    |
 |                                 getSize(node.left) + getSize(node.right) + 1                                                       |
 +------------------------------------------------------------------------------------------------------------------------------------+
              |
              v
 +----------------------+
 |      Return root     |
 +----------------------+

 -- ДОКАЗАТЕЛЬСТВО КОРРЕКТНОСТИ --
 Алгоритм гарантирует корректность BST после удаления узла благодаря точной обработке трёх основных случаев.
 В случае, когда удаляемый узел не имеет детей, он просто удаляется, что не нарушает структуру дерева.
 В случае, когда удаляемый узел имеет одного ребёнка, этот ребёнок поднимается на место удаляемого узла, сохраняя упорядоченность ключей.
 В случае, когда удаляемый узел имеет двух детей, замена на наименьший узел в правом поддереве гарантирует сохранение всех свойств BST.
 Обновление размеров поддеревьев после каждой операции поддерживает корректность информации о размерах поддеревьев.

 -- ВРЕМЕННАЯ СЛОЖНОСТЬ --
 Временная сложность алгоритма удаления узла в бинарном дереве поиска составляет O(h), где h — высота дерева.
 В худшем случае алгоритм проходит от корня до листа дерева, что занимает O(h) времени. Обновление размеров поддеревьев также выполняется за O(h) времени.

 -- ПРОСТРАНСТВЕННАЯ СЛОЖНОСТЬ --
 Пространственная сложность алгоритма составляет O(h) из-за рекурсивных вызовов, которые занимают стек памяти.
 В худшем случае высота дерева может быть равна количеству узлов в дереве, что приводит к пространственной сложности O(h).
 Дополнительно, алгоритм не использует значительных дополнительных данных, кроме указателей и счётчиков размеров поддеревьев.
 */

import Foundation

func getSize(node: Node?) -> Int {
  if node == nil {
    return 0
  }
  return node!.size
}

func updateSize(node: Node?) {
  if let node = node {
    node.size = 1 + getSize(node: node.left) + getSize(node: node.right)
  }
}

func findMin(node: Node?) -> Node? {
  var current = node
  while current?.left != nil {
    current = current?.left
  }
  return current
}

func removeMin(node: Node?) -> Node? {
  if node?.left == nil {
    return node?.right
  }
  node?.left = removeMin(node: node?.left)
  updateSize(node: node)
  return node
}

func remove(root: Node?, key: Int) -> Node? {
  guard let node = root else {
    return nil
  }

  if key < node.value {
    node.left = remove(root: node.left, key: key)
  } else if key > node.value {
    node.right = remove(root: node.right, key: key)
  } else {
    if node.left == nil {
      return node.right
    }
    if node.right == nil {
      return node.left
    }

    let minNode = findMin(node: node.right)
    minNode?.right = removeMin(node: node.right)
    minNode?.left = node.left
    
    updateSize(node: minNode)
    return minNode
  }

  updateSize(node: node)
  return node
}
