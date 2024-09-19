// I. Сложное поле с цветочками

import Foundation

func maxFlowersAndPath(n: Int, m: Int, field: [[Int]]) -> (Int, String) {
  var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
  var path = Array(repeating: Array(repeating: "", count: m), count: n)
  
  // Инициализация dp и path для первой клетки
  dp[n-1][0] = field[n-1][0]
  
  // Заполнение первой колонки
  for i in stride(from: n-2, through: 0, by: -1) {
    dp[i][0] = dp[i+1][0] + field[i][0]
    path[i][0] = "U"
  }
  
  // Заполнение первой строки
  for j in 1..<m {
    dp[n-1][j] = dp[n-1][j-1] + field[n-1][j]
    path[n-1][j] = "R"
  }
  
  // Заполнение dp и path для остальных клеток
  for i in stride(from: n-2, through: 0, by: -1) {
    for j in 1..<m {
      if dp[i+1][j] > dp[i][j-1] {
        dp[i][j] = dp[i+1][j] + field[i][j]
        path[i][j] = "U"
      } else {
        dp[i][j] = dp[i][j-1] + field[i][j]
        path[i][j] = "R"
      }
    }
  }
  
  // Восстановление маршрута
  var route = ""
  var i = 0
  var j = m - 1
  
  while i != n - 1 || j != 0 {
    route.append(path[i][j])
    if path[i][j] == "U" {
      i += 1
    } else if path[i][j] == "R" {
      j -= 1
    }
  }
  
  return (dp[0][m-1], String(route.reversed()))
}

if let input = readLine() {
  let parts = input.split(separator: " ")
  let n = Int(parts[0])!
  let m = Int(parts[1])!
  
  var field = [[Int]]()
  
  for _ in 0..<n {
    if let line = readLine() {
      field.append(line.map { Int(String($0))! })
    }
  }
  
  let result = maxFlowersAndPath(n: n, m: m, field: field)
  print(result.0)
  print(result.1)
}

