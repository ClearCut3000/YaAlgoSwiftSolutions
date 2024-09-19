// E. Покупка домов

import Foundation

let nk = readLine()!.split(separator: " ").map({ Int($0)! })
let n = nk[0]
var k = nk[1]
var prices = readLine()!.split(separator: " ").map({ Int($0)! }).sorted(by: >)

var housesCount = 0

for price in prices {
  if !prices.isEmpty, let cheapestHouse = prices.last, k >= cheapestHouse {
    prices.removeLast()
    housesCount += 1
    k -= cheapestHouse
  }
}

print(housesCount)
