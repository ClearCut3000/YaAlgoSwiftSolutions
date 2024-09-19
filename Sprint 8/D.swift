// D. Общий префикс

import Foundation

func longestCommonPrefix(_ strings: [String]) -> Int {
  // Если нет строк, вернуть 0
  guard let firstString = strings.first else { return 0 }
  
  // Начинаем с первой строки как начального префикса
  var prefix = Array(firstString)
  
  // Проходим по остальным строкам
  for str in strings.dropFirst() {
    let currentStr = Array(str)
    var newPrefixLength = 0
    
    // Сравниваем символы текущей строки с текущим префиксом
    while newPrefixLength < min(prefix.count, currentStr.count) &&
            prefix[newPrefixLength] == currentStr[newPrefixLength] {
      newPrefixLength += 1
    }
    
    // Обрезаем префикс до совпавшей длины
    prefix = Array(prefix.prefix(newPrefixLength))
    
    // Если префикс стал пустым, можно завершать
    if prefix.isEmpty {
      return 0
    }
  }
  
  // Длина итогового префикса
  return prefix.count
}

let n = Int(readLine()!)!
var strings = [String]()

for _ in 0..<n {
  let str = readLine()!
  strings.append(str)
}

print(longestCommonPrefix(strings))
