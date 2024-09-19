// K. Гороскопы

import Foundation

// Функция для поиска наибольшей общей подпоследовательности
func longestCommonSubsequence(_ a: [Int], _ b: [Int]) -> (length: Int, indicesA: [Int], indicesB: [Int]) {
  let n = a.count
  let m = b.count
  
  // Таблица для хранения длины НОП
  var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
  
  // Заполняем таблицу dp
  for i in 1...n {
    for j in 1...m {
      if a[i - 1] == b[j - 1] {
        dp[i][j] = dp[i - 1][j - 1] + 1
      } else {
        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
      }
    }
  }
  
  // Восстанавливаем НОП
  var i = n
  var j = m
  var indicesA = [Int]()
  var indicesB = [Int]()
  
  while i > 0 && j > 0 {
    if a[i - 1] == b[j - 1] {
      indicesA.append(i)
      indicesB.append(j)
      i -= 1
      j -= 1
    } else if dp[i - 1][j] > dp[i][j - 1] {
      i -= 1
    } else {
      j -= 1
    }
  }
  
  // Порядок должен быть по возрастанию
  indicesA.reverse()
  indicesB.reverse()
  
  return (dp[n][m], indicesA, indicesB)
}

// Чтение данных
if let n = Int(readLine()!), let a = readLine()?.split(separator: " ").compactMap({ Int($0) }),
   let m = Int(readLine()!), let b = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
  
  let result = longestCommonSubsequence(a, b)
  
  // Вывод результатов
  print(result.length)
  print(result.indicesA.map { String($0) }.joined(separator: " "))
  print(result.indicesB.map { String($0) }.joined(separator: " "))
}
