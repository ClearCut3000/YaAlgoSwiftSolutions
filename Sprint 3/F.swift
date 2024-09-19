// F. Периметр треугольника

import Foundation

func maxPerimeter(_ sides: [Int]) -> Int {
  
  for i in 0..<(sides.count - 2) {
    let a = sides[i]
    let b = sides[i + 1]
    let c = sides[i + 2]
    
    if a < b + c {
      return a + b + c
    }
  }
  
  return 0
}

let n = Int(readLine()!)
let sides = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
let maxPerimeterValue = maxPerimeter(sides)
print(maxPerimeterValue)
