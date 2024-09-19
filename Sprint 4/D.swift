//  D. Полиномиальный хеш

import Foundation

func polynomialHash(s: String, a: Int, m: Int) -> Int {
  var powerOfP = 1
  var hashValue = 0
  
  for char in s {
    let charValue = Int(char.asciiValue!)
    hashValue = (hashValue + charValue * powerOfP) % m
    powerOfP = (powerOfP * a) % m
  }
  return hashValue
}

if let a = Int(readLine()!),
   let m = Int(readLine()!),
   let string = readLine() {
  let reversedString = String(string.reversed())
  let hash = polynomialHash(s: reversedString, a: a, m: m)
  print(hash)
}
