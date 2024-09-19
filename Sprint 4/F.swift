// F. Префиксные хеши

import Foundation

func polynomialHash(_ s: [UInt8], _ a: Int, _ m: Int) -> [Int] {
  var hashes = [Int](repeating: 0, count: s.count + 1)
  var powerOfA = 1
  for i in 1...s.count {
    hashes[i] = (hashes[i - 1] * a + Int(s[i - 1])) % m
    powerOfA = (powerOfA * a) % m
  }
  return hashes
}

func fastPowRecursive(_ x: Int, _ p: Int, _ r: Int) -> Int {
  if p == 0 {
    return 1
  }
  var result = fastPowRecursive(x, p / 2, r)
  result = (result * result) % r
  if p % 2 == 1 {
    result = (result * x) % r
  }
  return result
}

let a = Int(readLine()!)!
let m = Int(readLine()!)!
let s = Array(readLine()!.utf8)
let t = Int(readLine()!)!

let hashes = polynomialHash(s, a, m)

for _ in 0..<t {
  let range = readLine()!.split(separator: " ").map { Int($0)! }
  let l = range[0]
  let r = range[1]
  let hashValue: Int
  if l == r {
    hashValue = Int(s[l - 1]) % m
  } else {
    let hashFromLToR = (hashes[r] - (hashes[l - 1] * fastPowRecursive(a, r - l + 1, m)) % m + m) % m
    hashValue = hashFromLToR
  }
  print(hashValue)
}
