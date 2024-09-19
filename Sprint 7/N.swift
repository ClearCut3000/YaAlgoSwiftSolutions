// N. Гоша в ресторане

import Foundation

let nm = 1001
let inf = Int.max

var prices = [Int](repeating: 0, count: nm)
var dp = [[Int]](repeating: [Int](repeating: -1, count: nm), count: nm)
var path = [[Int]](repeating: [Int](repeating: 0, count: nm), count: nm)
var days = [Int](repeating: 0, count: nm)

var n = 0
var res = inf
var k1 = 0
var k2 = 0

func readInput() {
  if let input = readLine(), let days = Int(input) {
    n = days
  }
  for i in 1...n {
    if let input = readLine(), let price = Int(input) {
      prices[i] = price
    }
  }
}

func solve() {
  dp[0][0] = 0
  
  for i in 0..<n {
    for j in 0...i where dp[i][j] != -1 {
      // Без использования купона
      if j > 0 {
        if dp[i + 1][j - 1] > dp[i][j] || dp[i + 1][j - 1] == -1 {
          dp[i + 1][j - 1] = dp[i][j]
          path[i + 1][j - 1] = j
        }
      }
      
      // Использование купона или без него
      let k = prices[i + 1] > 500 ? 1 : 0
      
      if dp[i + 1][j + k] > dp[i][j] + prices[i + 1] || dp[i + 1][j + k] == -1 {
        dp[i + 1][j + k] = dp[i][j] + prices[i + 1]
        path[i + 1][j + k] = j
      }
    }
  }
  
  res = inf
  for i in 0...n {
    if dp[n][i] != -1 && dp[n][i] <= res {
      res = dp[n][i]
      k1 = i
    }
  }
  
  var j = k1
  k2 = 0
  for i in stride(from: n, through: 1, by: -1) {
    if j + 1 == path[i][j] {
      k2 += 1
      days[k2] = i
    }
    j = path[i][j]
  }
}

func writeOutput() {
  print("\(res) \(k2)")
  if k2 > 0 {
    let sortedUsedDays = days[1...k2].sorted().map { String($0) }.joined(separator: " ")
    print(sortedUsedDays)
  }
}

func main() {
  readInput()
  solve()
  writeOutput()
}

main()
