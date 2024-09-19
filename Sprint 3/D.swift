// D. Печеньки

import Foundation

let n = Int(readLine()!)!
let factors = readLine()!.split(separator: " ").compactMap({ Int($0)! }).sorted(by: >)
let m = Int(readLine()!)
var sizes = readLine()!.split(separator: " ").compactMap({ Int($0)! }).sorted()

var happyChild = 0

for preference in factors {
  if !sizes.isEmpty, let smallestSize = sizes.last, preference <= smallestSize {
    sizes.removeLast()
    happyChild += 1
  }
}

print(happyChild)
