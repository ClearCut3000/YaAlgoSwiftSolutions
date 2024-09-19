// L. МногоГоша

import Foundation

// Вспомогательная функция для вычисления полиномиального хеша
func polynomialHash(_ s: String, _ q: Int, _ m: Int) -> Int {
  var hash = 0
  for ch in s {
    let chNum = Int(ch.asciiValue! - Character("a").asciiValue! + 1)
    hash = (hash * q + chNum) % m
  }
  return hash
}

// Вспомогательная функция для вычисления степени числа с модулем
func powerMod(_ base: Int, _ exp: Int, _ mod: Int) -> Int {
  var result = 1
  var base = base % mod
  var exp = exp

  while exp > 0 {
    if exp % 2 == 1 {
      result = (result * base) % mod
    }
    base = (base * base) % mod
    exp /= 2
  }

  return result
}

// Основная функция для поиска подстрок длины n, которые встречаются как минимум k раз
func substringsKTimes(_ s: String, _ n: Int, _ k: Int) -> [Int] {
  let m1 = 1_000_000_007
  let m2 = 1_000_000_009
  let q1 = 31
  let q2 = 29
  let q1Big = powerMod(q1, n - 1, m1)
  let q2Big = powerMod(q2, n - 1, m2)

  var hash1 = polynomialHash(String(s.prefix(n)), q1, m1)
  var hash2 = polynomialHash(String(s.prefix(n)), q2, m2)

  var counter = [String: (index: Int, count: Int)]()
  counter["\(hash1)-\(hash2)"] = (0, 1)

  let sArray = Array(s)
  for i in 1...(s.count - n) {
    let chPrev = Int(sArray[i - 1].asciiValue! - Character("a").asciiValue! + 1)
    let chNext = Int(sArray[i + n - 1].asciiValue! - Character("a").asciiValue! + 1)

    hash1 = ((hash1 - chPrev * q1Big) * q1 + chNext) % m1
    hash2 = ((hash2 - chPrev * q2Big) * q2 + chNext) % m2

    if hash1 < 0 { hash1 += m1 }
    if hash2 < 0 { hash2 += m2 }

    let key = "\(hash1)-\(hash2)"
    if let value = counter[key] {
      counter[key] = (value.index, value.count + 1)
    } else {
      counter[key] = (i, 1)
    }
  }

  return counter.compactMap { (key, value) in
    return value.count >= k ? value.index : nil
  }
}

// Основная часть программы
if let line1 = readLine(), let line2 = readLine() {
  let nk = line1.split(separator: " ").compactMap { Int($0) }
  let s = line2

  let n = nk[0]
  let k = nk[1]

  let result = substringsKTimes(s, n, k)
  print(result.map { String($0) }.joined(separator: " "))
}

