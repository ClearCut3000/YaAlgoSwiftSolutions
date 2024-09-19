// H. Поле с цветочками

import Foundation

func maxFlowers(n: Int, m: Int, field: [[Int]]) -> Int {
  var dp = Array(repeating: Array(repeating: 0, count: m), count: n)

  dp[n-1][0] = field[n-1][0]

  for i in stride(from: n-2, through: 0, by: -1) {
    dp[i][0] = dp[i+1][0] + field[i][0]
  }

  for j in 1..<m {
    dp[n-1][j] = dp[n-1][j-1] + field[n-1][j]
  }

  for i in stride(from: n-2, through: 0, by: -1) {
    for j in 1..<m {
      dp[i][j] = max(dp[i+1][j], dp[i][j-1]) + field[i][j]
    }
  }

  return dp[0][m-1]
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

  print(maxFlowers(n: n, m: m, field: field))
}

