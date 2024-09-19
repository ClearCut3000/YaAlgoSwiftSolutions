// I. Повтор

import Foundation

// Функция для вычисления префикс-функции
func prefixFunction(_ s: String) -> [Int] {
  let n = s.count
  var p = [Int](repeating: 0, count: n)
  let sArray = Array(s)

  for i in 1..<n {
    var j = p[i - 1]

    while j > 0 && sArray[i] != sArray[j] {
      j = p[j - 1]
    }

    if sArray[i] == sArray[j] {
      j += 1
    }

    p[i] = j
  }

  return p
}

// Основная функция для поиска наибольшего повтора
func findLargestRepetition(_ s: String) -> Int {
  let n = s.count
  let p = prefixFunction(s)

  let lengthOfPattern = n - p[n - 1]

  // Проверяем, если строка полностью делится на длину найденного шаблона
  if n % lengthOfPattern == 0 {
    return n / lengthOfPattern
  } else {
    return 1
  }
}

if let s = readLine() {
  print(findLargestRepetition(s))
}
