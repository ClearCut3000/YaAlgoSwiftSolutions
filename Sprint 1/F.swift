// F. Палиндром

func isPalindrome(_ s: String) -> Bool {
  let s = s.lowercased().filter { $0.isLetter || $0.isNumber }
  return s == String(s.reversed())
}

let string = readLine()!
let result = isPalindrome(string)
result ? print("True") :  print("False")
