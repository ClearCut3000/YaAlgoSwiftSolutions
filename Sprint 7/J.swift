// J. Путешествие

import Foundation

func longestIncreasingSubsequence(ratings: [Int]) -> ([Int], Int) {
  let n = ratings.count
  var dp = Array(repeating: 1, count: n)
  var prev = Array(repeating: -1, count: n)
  
  var maxLength = 1
  var maxIndex = 0
  
  for i in 1..<n {
    for j in 0..<i {
      if ratings[i] > ratings[j] && dp[i] < dp[j] + 1 {
        dp[i] = dp[j] + 1
        prev[i] = j
      }
    }
    if dp[i] > maxLength {
      maxLength = dp[i]
      maxIndex = i
    }
  }
  
  // Восстановление самой последовательности
  var sequence = [Int]()
  var currentIndex = maxIndex
  while currentIndex != -1 {
    sequence.append(currentIndex + 1) // +1, чтобы индексы начинались с 1
    currentIndex = prev[currentIndex]
  }
  
  sequence.reverse() // Обратный порядок, чтобы получить правильную последовательность
  
  return (sequence, maxLength)
}

if let nInput = readLine(), let ratingsInput = readLine() {
  let n = Int(nInput)!
  let ratings = ratingsInput.split(separator: " ").map { Int($0)! }
  
  let (sequence, maxLength) = longestIncreasingSubsequence(ratings: ratings)
  
  print(maxLength)
  print(sequence.map { String($0) }.joined(separator: " "))
}
