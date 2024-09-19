// A. Биржа

import Foundation

let n = Int(readLine()!)!
let prices = readLine()!.split(separator: " ").map { Int($0)! }

let profit = zip(prices.dropFirst(), prices)
  .map { max(0, $0.0 - $0.1) }
  .reduce(0, +)

print(profit)
