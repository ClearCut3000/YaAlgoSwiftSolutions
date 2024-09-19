// L. Подсчёт префикс-функции

import Foundation

func prefixFunction(s: String) -> [Int] {
  // Функция возвращает массив длины |s|
  let n = s.count
  var pi = [Int](repeating: 0, count: n)
  // sChars обеспечит эффективный доступ к символам строки
  let sChars = Array(s)

  for i in 1..<n {
    var k = pi[i-1]
    while k > 0 && sChars[k] != sChars[i] {
      k = pi[k-1]
    }
    if sChars[k] == sChars[i] {
      k += 1
    }
    pi[i] = k
  }
  return pi
}

if let string = readLine() {
  let result = prefixFunction(s: string)
  print(result.map { String($0) }.joined(separator: " "))
}
