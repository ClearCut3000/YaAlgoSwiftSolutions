// E. Самое длинное слово

import Foundation

let l = Int(readLine()!)!
let string = readLine()!

func findLongestWord(_ input: String) -> String {
  let words = input.components(separatedBy: " ")
  guard let longestWord = words.max(by: { $0.count < $1.count }) else {
    return ""
  }
  return longestWord
}

let longestWord = findLongestWord(string)
print(longestWord)
print(longestWord.count)
