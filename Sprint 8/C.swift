// C. Самый длинный палиндром 2

import Foundation

// Функция для построения палиндрома
func buildPalindrome(from s: String) -> String {
  // Шаг 1: Подсчёт частоты символов
  var freq = [Character: Int]()
  for char in s {
    freq[char, default: 0] += 1
  }
  
  // Шаг 2: Построение левой части палиндрома
  var leftPart = ""
  var middleChar: Character? = nil
  
  // Проходим по символам в алфавитном порядке
  for char in "abcdefghijklmnopqrstuvwxyz" {
    if let count = freq[char] {
      // Если символ встречается нечётное количество раз
      if count % 2 != 0 {
        middleChar = middleChar ?? char // выбираем первый символ как центр
      }
      
      // Добавляем половину символов в левую часть
      leftPart += String(repeating: char, count: count / 2)
    }
  }
  
  // Шаг 3: Построение полной строки
  let rightPart = String(leftPart.reversed())
  let palindrome = leftPart + (middleChar.map { String($0) } ?? "") + rightPart
  
  return palindrome
}

if let s = readLine() {
  let palindrome = buildPalindrome(from: s)
  print(palindrome)
}
