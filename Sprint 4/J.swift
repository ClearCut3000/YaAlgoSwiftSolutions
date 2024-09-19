// J. Общий подмассив

import Foundation

// Константы для хеширования
let M = Int(1e9) + 7
let Q = 257

// Функция для вычисления префиксного хеша первых n элементов массива
func prefixHash(_ array: [Int], _ n: Int) -> Int {
  var hashVal = 0
  for i in 0..<n {
    hashVal = (hashVal * Q + array[i] + 1) % M
  }
  return hashVal
}

// Функция для проверки, нет ли коллизий между подстроками
func isNotCollision(_ firstSubstring: [Int], _ secondSubstring: [Int], _ n: Int, _ firstIndices: [Int], _ secondIndex: Int) -> Bool {
  for fIndex in firstIndices {
    var isMatching = true
    for i in 0..<n {
      if firstSubstring[fIndex + i] != secondSubstring[secondIndex + i] {
        isMatching = false
        break
      }
    }
    if isMatching {
      return true
    }
  }
  return false
}

// Функция для проверки наличия общего подотрезка длины n
func hasCommonSubarrayOfLen(_ a: [Int], _ b: [Int], _ n: Int) -> Bool {
  let qBig = pow(Q, n - 1, M)
  
  var aHashes = [Int: [Int]]()
  var h = prefixHash(a, n)
  aHashes[h] = [0]
  
  for i in 1..<(a.count - n + 1) {
    h = ((h - (a[i - 1] + 1) * qBig) * Q + a[i + n - 1] + 1) % M
    if aHashes[h] == nil {
      aHashes[h] = [i]
    } else {
      aHashes[h]?.append(i)
    }
  }
  
  h = prefixHash(b, n)
  if let aIndices = aHashes[h], isNotCollision(a, b, n, aIndices, 0) {
    return true
  }
  
  for i in 1..<(b.count - n + 1) {
    h = ((h - (b[i - 1] + 1) * qBig) * Q + b[i + n - 1] + 1) % M
    if let aIndices = aHashes[h], isNotCollision(a, b, n, aIndices, i) {
      return true
    }
  }
  
  return false
}

// Функция для нахождения длины наибольшего общего подотрезка
func longestCommonSubarrayOfLen(_ a: [Int], _ b: [Int]) -> Int {
  var left = 0
  var right = min(a.count, b.count)
  
  while left < right {
    let mid = (left + right + 1) / 2
    if hasCommonSubarrayOfLen(a, b, mid) {
      left = mid
    } else {
      right = mid - 1
    }
  }
  
  return left
}

// Вспомогательная функция для быстрого возведения в степень
func pow(_ base: Int, _ exp: Int, _ mod: Int) -> Int {
  if exp == 0 {
    return 1
  }
  let half = pow(base, exp / 2, mod)
  let halfSq = (half * half) % mod
  return exp % 2 == 0 ? halfSq : (halfSq * base) % mod
}

// Чтение входных данных
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map { Int($0)! }

// Нахождение и вывод длины наибольшего общего подотрезка
print(longestCommonSubarrayOfLen(a, b))
