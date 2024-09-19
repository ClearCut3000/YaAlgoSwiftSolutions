// G. Поиск со сдвигом

import Foundation

func findPatternOccurrences(n: Int, x: [Int], m: Int, a: [Int]) -> [Int] {
  guard m <= n else { return [] }
  
  // Рассчитываем разности для шаблона A
  var patternDifferences = [Int]()
  for i in 1..<m {
    patternDifferences.append(a[i] - a[i - 1])
  }
  
  // Рассчитываем разности для каждой последовательности длины m в X
  var result = [Int]()
  for i in 0...(n - m) {
    var differencesMatch = true
    for j in 1..<m {
      if x[i + j] - x[i + j - 1] != patternDifferences[j - 1] {
        differencesMatch = false
        break
      }
    }
    if differencesMatch {
      result.append(i + 1)  // Позиции нумеруются с 1
    }
  }
  
  return result
}

if let n = Int(readLine()!),
   let x = readLine()?.split(separator: " ").compactMap({ Int($0) }),
   let m = Int(readLine()!),
   let a = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
  
  let occurrences = findPatternOccurrences(n: n, x: x, m: m, a: a)
  print(occurrences.map { String($0) }.joined(separator: " "))
}
