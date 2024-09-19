// I. Разные деревья поиска

func numberOfBinarySearchTrees(n: Int) -> Int {
  guard n >= 0 else { return 0 }
  
  var catalan = [Int](repeating: 0, count: n + 1)
  catalan[0] = 1
  catalan[1] = 1
  
  for i in 2...n {
    for j in 0..<i {
      catalan[i] += catalan[j] * catalan[i - 1 - j]
    }
  }
  
  return catalan[n]
}

if let input = readLine(), let n = Int(input) {
  print(numberOfBinarySearchTrees(n: n))
}
