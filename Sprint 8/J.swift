// J. Случай верблюда

import Foundation

// Функция для извлечения заглавных букв из строки
func extractUppercase(from s: String) -> String {
  return s.filter { $0.isUppercase }
}

// Чтение количества классов
let n = Int(readLine()!)!

// Чтение классов
var classes = [String]()
for _ in 0..<n {
  classes.append(readLine()!)
}

// Создание словаря, где ключи — это шаблоны заглавных букв, а значения — списки строк
var uppercaseMap = [String: [String]]()

for className in classes {
  let upperCase = extractUppercase(from: className)
  if uppercaseMap[upperCase] != nil {
    uppercaseMap[upperCase]!.append(className)
  } else {
    uppercaseMap[upperCase] = [className]
  }
}

// Сортируем строки в каждом шаблоне лексикографически
for key in uppercaseMap.keys {
  uppercaseMap[key]?.sort()
}

// Чтение количества запросов
let m = Int(readLine()!)!

// Обработка каждого запроса
for _ in 0..<m {
  let query = readLine()!
  var matched = [String]()
  
  // Ищем все строки, у которых заглавные буквы начинаются с запроса
  for (upperCase, classNames) in uppercaseMap {
    if upperCase.hasPrefix(query) {
      matched.append(contentsOf: classNames)
    }
  }
  
  // Сортируем результаты и выводим их
  if matched.isEmpty {
    print("")
  } else {
    matched.sort()
    for result in matched {
      print(result)
    }
  }
}
