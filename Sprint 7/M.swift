// M. Рюкзак

import Foundation

func knapsackWithValues(items: [(weight: Int, value: Int)], capacity: Int) -> (maxValue: Int, itemsIncluded: [Int]) {
  let n = items.count
  var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: n + 1)
  var taken = Array(repeating: Array(repeating: false, count: capacity + 1), count: n + 1)
  
  // Построение таблицы dp
  for i in 1...n {
    let (weight, value) = items[i - 1]
    for j in 0...capacity {
      dp[i][j] = dp[i - 1][j]  // не берем предмет i
      if j >= weight {
        let newValue = dp[i - 1][j - weight] + value
        if newValue > dp[i][j] {
          dp[i][j] = newValue
          taken[i][j] = true
        }
      }
    }
  }
  
  var maxValue = dp[n][capacity]
  var weightLeft = capacity
  var itemsIncluded = [Int]()
  
  for i in stride(from: n, through: 1, by: -1) {
    if taken[i][weightLeft] {
      itemsIncluded.append(i)
      weightLeft -= items[i - 1].weight
    }
  }
  
  return (maxValue, itemsIncluded.reversed())
}

if let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
  let n = input[0]
  let capacity = input[1]
  
  var items = [(weight: Int, value: Int)]()
  
  for _ in 0..<n {
    if let itemInput = readLine()?.split(separator: " ").compactMap({ Int($0) }) {
      let weight = itemInput[0]
      let value = itemInput[1]
      items.append((weight, value))
    }
  }
  
  let result = knapsackWithValues(items: items, capacity: capacity)
  
  print(result.itemsIncluded.count)
  print(result.itemsIncluded.map { String($0) }.joined(separator: " "))
}
