// G. Сумма четвёрок

import Foundation

func fourSum(nums: [Int], target: Int) -> [[Int]] {
  var result = [[Int]]()
  let n = nums.count
  
  if n < 4 { return result }
  
  // Сортируем массив для упрощения использования двух указателей
  let sortedNums = nums.sorted()
  
  for i in 0..<(n-3) {
    // Пропускаем дубликаты
    if i > 0 && sortedNums[i] == sortedNums[i-1] {
      continue
    }
    
    for j in (i+1)..<(n-2) {
      // Пропускаем дубликаты
      if j > i + 1 && sortedNums[j] == sortedNums[j-1] {
        continue
      }
      
      var left = j + 1
      var right = n - 1
      
      while left < right {
        let sum = sortedNums[i] + sortedNums[j] + sortedNums[left] + sortedNums[right]
        
        if sum == target {
          result.append([sortedNums[i], sortedNums[j], sortedNums[left], sortedNums[right]])
          
          // Пропускаем дубликаты
          while left < right && sortedNums[left] == sortedNums[left + 1] {
            left += 1
          }
          
          // Пропускаем дубликаты
          while left < right && sortedNums[right] == sortedNums[right - 1] {
            right -= 1
          }
          
          left += 1
          right -= 1
        } else if sum < target {
          left += 1
        } else {
          right -= 1
        }
      }
    }
  }
  
  return result
}

let n = Int(readLine()!)!
let S = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }

let result = fourSum(nums: array, target: S)
print(result.count)
for quad in result {
  print(quad.map { String($0) }.joined(separator: " "))
}
