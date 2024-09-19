// L. Фибоначчи по модулю

import Foundation

func fibonacci(_ n: Int, _ k: Int) -> Int {
  let mod = Int(pow(10.0, Double(k)))
  var num1 = 1
  var num2 = 1
  
  if n <= 1 {
    return 1
  } else {
    for _ in 1..<n {
      let temp = (num1 + num2) % mod
      num1 = num2
      num2 = temp
    }
    return num2
  }
}

let inputs = readLine()!.split(separator: " ").map { Int($0)! }
print(fibonacci(inputs[0], inputs[1]))
