// H. Двоичная система

var firstBinary = readLine()!
var secondBinary = readLine()!

func add(_ firstBinary: String, to secondBinary: String) -> String {
  guard !firstBinary.isEmpty else { return secondBinary }
  guard !secondBinary.isEmpty else { return firstBinary }
  var result = ""
  var remnant = 0
  var i = firstBinary.count - 1
  var j = secondBinary.count - 1

  let firstArray = Array(firstBinary)
  let secondArray = Array(secondBinary)

  while i >= 0 || j >= 0 || remnant != 0 {
    let sum = ((i >= 0 && firstArray[i] == "1") ? Int(String(firstArray[i]))! : 0) + ((j >= 0 && secondArray[j] == "1") ? Int(String(secondArray[j]))! : 0) + remnant
    result = String(sum % 2) + result
    remnant = sum / 2
    i -= 1
    j -= 1
  }
  return result
}

print(add(firstBinary, to: secondBinary))
