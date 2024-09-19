// L. Просеивание вниз

func siftDown(heap: inout [Int], idx: Int) -> Int {
  let n = heap.count - 1 // Поскольку индексация начинается с 1
  var largest = idx
  let left = 2 * idx
  let right = 2 * idx + 1
  
  // Если левый ребенок существует и больше текущего узла
  if left <= n && heap[left] > heap[largest] {
    largest = left
  }
  
  // Если правый ребенок существует и больше текущего узла (или левого ребенка)
  if right <= n && heap[right] > heap[largest] {
    largest = right
  }
  
  // Если наибольший элемент не текущий узел
  if largest != idx {
    // Обмен значений
    heap.swapAt(idx, largest)
    // Рекурсивный вызов для поддерева, в котором произошел обмен
    return siftDown(heap: &heap, idx: largest)
  }
  
  // Возвращаем индекс, на котором элемент оказался после просеивания
  return idx
}

