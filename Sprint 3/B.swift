// B. Комбинации

import Foundation

let symbols: [Int: String] = [
  2: "abc",
  3: "def",
  4: "ghi",
  5: "jkl",
  6: "mno",
  7: "pqrs",
  8: "tuv",
  9: "wxyz"
]

func createAllPairs(_ sequences: [String]) -> [String] {
  guard !sequences.isEmpty else {
    return [""]
  }

  let firstSeq = sequences[0]
  let remainingPairs = createAllPairs(Array(sequences.dropFirst()))

  var pairs = [String]()
  for char in firstSeq {
    for pair in remainingPairs {
      pairs.append(String(char) + pair)
    }
  }
  return pairs
}

if let input = readLine() {
  let numbers = input.compactMap { Int(String($0)) }
  var sequences = [String]()
  for number in numbers {
    if let chars = symbols[number] {
      sequences.append(chars)
    }
  }

  let result = createAllPairs(sequences)
  print(result.joined(separator: " "))
}
