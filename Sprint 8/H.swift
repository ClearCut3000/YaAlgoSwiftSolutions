// H. Глобальная замена

import Foundation

// Функция для вычисления префикс-функции
func prefixFunction(_ s: String) -> [Int] {
  let n = s.count
  let sArray = Array(s)
  var pi = Array(repeating: 0, count: n)
  
  for i in 1..<n {
    var j = pi[i - 1]
    while j > 0 && sArray[i] != sArray[j] {
      j = pi[j - 1]
    }
    if sArray[i] == sArray[j] {
      j += 1
    }
    pi[i] = j
  }
  return pi
}

// Основная функция для замены вхождений
func replaceOccurrences(text: String, pattern: String, replacement: String) -> String {
  let combinedString = pattern + "#" + text
  let pi = prefixFunction(combinedString)
  
  var result = ""
  var i = 0
  let n = text.count
  let m = pattern.count
  let textArray = Array(text)
  
  while i < n {
    var matched = false
    if i + m <= n && pi[m + 1 + i + m - 1] == m {
      // Добавляем замену вместо шаблона
      result += replacement
      i += m
      matched = true
    }
    if !matched {
      // Если нет замены, добавляем текущий символ
      result.append(textArray[i])
      i += 1
    }
  }
  
  return result
}

if let text = readLine(),
   let s = readLine(),
   let t = readLine() {
  let result = replaceOccurrences(text: text, pattern: s, replacement: t)
  print(result)
}
