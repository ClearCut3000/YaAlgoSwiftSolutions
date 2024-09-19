// P. Частичная сортировка

import Foundation

struct Block {
  var min: Int
  var max: Int
}

func countBlocks(_ array: [Int]) -> Int {
  var blocks: [Block] = []

  for i in array {
    var curBlock = Block(min: i, max: i)

    while let lastBlock = blocks.last, lastBlock.max > curBlock.min {
      blocks.removeLast()
      curBlock.min = min(lastBlock.min, curBlock.min)
      curBlock.max = max(lastBlock.max, curBlock.max)
    }

    blocks.append(curBlock)
  }

  return blocks.count
}

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

let result = countBlocks(nums)
print(result)
