//  O. Разность треш-индексов

let n = Int(readLine()!)!
let nArray = readLine()!.split(separator: " ").map { Int($0)! }
let k = Int(readLine()!)!

func countPairs(_ array: [Int], _ n: Int, _ maxDif: Int) -> Int {
  var count = 0
  var i = 0
  for j in 0..<n {
    while array[j] - array[i] > maxDif {
      i += 1
    }
    count += j - i
  }
  return count
}

func minDiffByIndex(_ array: [Int], _ n: Int,  _ index: Int) -> Int {
  let sortedArray = array.sorted()
  var minDif = Int.max
  for i in 0..<n - 1 {
    minDif = min(minDif, sortedArray[i + 1] - sortedArray[i])
  }
  var maxDiff = sortedArray.last! - sortedArray.first!
  
  while minDif < maxDiff {
    let midDiff = (minDif + maxDiff) / 2
    if countPairs(sortedArray, n, midDiff) < index {
      minDif = midDiff + 1
    } else {
      maxDiff = midDiff
    }
  }
  return minDif
}

let result = minDiffByIndex(nArray, n, k)
print(result)
