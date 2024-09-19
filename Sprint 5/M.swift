// M. Просеивание вверх

func siftUp(heap: inout [Int], idx: Int) -> Int {
  var currentIndex = idx
  let n = heap.count - 1 // Поскольку индексация начинается с 1
  
  while currentIndex > 1 {
    let parentIndex = currentIndex / 2
    
    // Если текущий узел больше родителя, меняем их местами
    if heap[currentIndex] > heap[parentIndex] {
      heap.swapAt(currentIndex, parentIndex)
      currentIndex = parentIndex
    } else {
      break
    }
  }
  
  // Возвращаем индекс, на котором элемент оказался после просеивания
  return currentIndex
}
