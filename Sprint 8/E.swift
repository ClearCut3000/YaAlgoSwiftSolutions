// E. Вставка строк

import Foundation

// Чтение исходной строки
let s = readLine()!

// Чтение количества вставок
let n = Int(readLine()!)!

// Преобразуем строку в массив символов
var sArray = Array(s)

// Список для хранения пар (позиция, строка)
var insertions: [(Int, String)] = []

// Считывание всех вставок
for _ in 0..<n {
  let input = readLine()!.split(separator: " ")
  let position = Int(input[1])!
  let substring = String(input[0])
  insertions.append((position, substring))
}

// Сортировка вставок по позициям
insertions.sort { $0.0 < $1.0 }

// Итоговый результат будем собирать в массиве строк
var result = [String]()
var lastPosition = 0

for (position, substring) in insertions {
  // Добавляем часть исходной строки до позиции вставки
  result.append(String(sArray[lastPosition..<position]))

  // Добавляем вставку
  result.append(substring)

  // Обновляем текущую позицию
  lastPosition = position
}

// Добавляем оставшуюся часть строки после последней вставки
result.append(String(sArray[lastPosition..<sArray.count]))

// Объединение элементов массива в одну строку
let finalResult = result.joined()

// Вывод результата
print(finalResult)
