// J. Пузырёк

import Foundation

func bubbleSort(_ array: inout [Int], _ n: Int) {
  var hasSwapped = false

  for index in 0..<n-1 {
    var flag = false
    for j in 0..<(n - index - 1) {
      if array[j] > array[j + 1] {
        array.swapAt(j, j + 1)
        flag = true
        hasSwapped = true
      }
    }
    if flag {
      print(array.map { String($0) }.joined(separator: " "))
    }
  }

  if !hasSwapped {
    print(array.map { String($0) }.joined(separator: " "))
  }
}

if let number = Int(readLine()!),
   let arrayString = readLine() {
  var array = arrayString.split(separator: " ").map { Int(String($0))! }
  bubbleSort(&array, number)
}
