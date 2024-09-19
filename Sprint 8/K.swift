// K. Сравнить две строки

import Foundation

func filterEvenPosChars(_ s: String) -> String {
  let evenPositionChars: Set<Character> = ["b", "d", "f", "h", "j", "l", "n", "p", "r", "t", "v", "x", "z"]
  return String(s.filter { evenPositionChars.contains($0) })
}

func compareStrings(_ a: String, _ b: String) -> Int {
  let filteredA = filterEvenPosChars(a)
  let filteredB = filterEvenPosChars(b)
  
  if filteredA < filteredB {
    return -1
  } else if filteredA > filteredB {
    return 1
  } else {
    return 0
  }
}

// Чтение входных данных
if let a = readLine(), let b = readLine() {
  let result = compareStrings(a, b)
  print(result)
}
