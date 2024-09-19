// B. Соревнование

import Foundation

func findLongestEqualSegment(_ rounds: [Int]) -> Int {
  var maxLength = 0
  var prefixSum = 0
  var sumIndexDict = [Int: Int]()
  sumIndexDict[0] = -1 // Для случая, когда префиксная сумма равна 0 до начала массива
  
  for (index, round) in rounds.enumerated() {
    prefixSum += (round == 0 ? -1 : 1)
    
    if let firstIndex = sumIndexDict[prefixSum] {
      maxLength = max(maxLength, index - firstIndex)
    } else {
      sumIndexDict[prefixSum] = index
    }
  }
  
  return maxLength
}

let n = Int(readLine()!)!
if n == 0 {
  print(0)
} else {
  let rounds = readLine()!.split(separator: " ").map { Int($0)! }
  let result = findLongestEqualSegment(rounds)
  print(result)
}
