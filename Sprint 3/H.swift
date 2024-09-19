// H. Большое число

import Foundation

if let n = Int(readLine()!), n > 0 {
  let nums = readLine()!.split(separator: " ").map { String($0) }.sorted { $0 + $1 > $1 + $0 }
  if nums[0] == "0" {
    print("0")
    exit(0)
  }
  print(nums.joined())
}
