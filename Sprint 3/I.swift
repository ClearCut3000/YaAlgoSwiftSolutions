// I. Любители конференций

import Foundation

let n = Int(readLine()!)!
let ids = readLine()!.split(separator: " ").map { Int($0)! }
let k = Int(readLine()!)!

var universityCount = [Int: Int]()

ids.forEach { id in
  universityCount[id, default: 0] += 1
}

let sortedUniversities = universityCount.sorted { (a, b) -> Bool in
  if a.value == b.value {
    return a.key < b.key
  } else {
    return a.value > b.value
  }
}

let result = sortedUniversities.prefix(k).map { $0.key }

print(result.map { String($0) }.joined(separator: " "))
