// H. Скобочная последовательность

import Foundation

func isBracketSequenceCorrect(_ s: String) -> Bool {
  var stack = [Character]()
  let openingBrackets: Set<Character> = ["(", "[", "{"]
  let closingBrackets: Set<Character> = [")", "]", "}"]
  let matchingBrackets: [Character: Character] = ["(": ")", "[": "]", "{": "}"]

  for bracket in s {
    if openingBrackets.contains(bracket) {
      stack.append(bracket)
    } else if closingBrackets.contains(bracket) {
      guard let lastBracket = stack.popLast(), matchingBrackets[lastBracket] == bracket else {
        return false
      }
    }
  }

  return stack.isEmpty
}

let s = readLine()!
if isBracketSequenceCorrect(s) {
  print("True")
} else {
  print("False")
}
