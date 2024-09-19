// B. Пограничный контроль

import Foundation

// Чтение входных данных
let passportName = readLine()!
let databaseName = readLine()!

func checkNames(passportName: String, databaseName: String) -> String {
  let len1 = passportName.count
  let len2 = databaseName.count
  
  // Если строки равны
  if passportName == databaseName {
    return "OK"
  }
  
  // Если разница в длине больше 1, невозможно выполнить одну операцию
  if abs(len1 - len2) > 1 {
    return "FAIL"
  }
  
  // Преобразуем строки в массивы символов для удобства
  let passportChars = Array(passportName)
  let databaseChars = Array(databaseName)
  
  // Проверка на удаление/вставку одного символа
  if len1 > len2 {
    return canRemoveOneChar(larger: passportChars, smaller: databaseChars) ? "OK" : "FAIL"
  } else if len1 < len2 {
    return canRemoveOneChar(larger: databaseChars, smaller: passportChars) ? "OK" : "FAIL"
  }
  
  // Проверка на замену одного символа
  return canReplaceOneChar(string1: passportChars, string2: databaseChars) ? "OK" : "FAIL"
}

// Функция для проверки возможности удаления одного символа
func canRemoveOneChar(larger: [Character], smaller: [Character]) -> Bool {
  var i = 0, j = 0
  while i < larger.count && j < smaller.count {
    if larger[i] != smaller[j] {
      if i != j {
        return false
      }
      i += 1
    } else {
      i += 1
      j += 1
    }
  }
  return true
}

// Функция для проверки возможности замены одного символа
func canReplaceOneChar(string1: [Character], string2: [Character]) -> Bool {
  var differenceFound = false
  for i in 0..<string1.count {
    if string1[i] != string2[i] {
      if differenceFound {
        return false
      }
      differenceFound = true
    }
  }
  return true
}

// Вывод результата
print(checkNames(passportName: passportName, databaseName: databaseName))
