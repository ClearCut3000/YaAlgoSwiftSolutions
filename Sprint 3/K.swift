// K. Сортировка слиянием

func merge(a: [Int], b: [Int]) -> [Int] {
  var merged: [Int] = []
  var i = 0
  var j = 0
  
  while i < a.count && j < b.count {
    if a[i] <= b[j] {
      merged.append(a[i])
      i += 1
    } else {
      merged.append(b[j])
      j += 1
    }
  }
  
  while i < a.count {
    merged.append(a[i])
    i += 1
  }
  
  while j < b.count {
    merged.append(b[j])
    j += 1
  }
  
  return merged
}

func merge_sort(arr: inout [Int]) {
  func merge_sort_recursive(arr: inout [Int], left: Int, right: Int) {
    if left + 1 < right {
      let mid = (left + right) / 2
      merge_sort_recursive(arr: &arr, left: left, right: mid)
      merge_sort_recursive(arr: &arr, left: mid, right: right)
      let merged = merge(a: Array(arr[left..<mid]), b: Array(arr[mid..<right]))
      for i in 0..<merged.count {
        arr[left + i] = merged[i]
      }
    }
  }
  merge_sort_recursive(arr: &arr, left: 0, right: arr.count)
}
