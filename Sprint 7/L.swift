// L. Золото лепреконов

import Foundation

func knapsack(weights: [Int], capacity: Int) -> Int {
  var dp = Array(repeating: 0, count: capacity + 1)
  
  for weight in weights {
    if weight <= capacity {
      for j in stride(from: capacity, through: weight, by: -1) {
        dp[j] = max(dp[j], dp[j - weight] + weight)
      }
    }
  }
  
  return dp[capacity]
}

if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
  let n = input[0]
  let capacity = input[1]
  
  if let weights = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
    let maxWeight = knapsack(weights: weights, capacity: capacity)
    print(maxWeight)
  }
}
