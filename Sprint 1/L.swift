// L. Лишняя буква

func findExtraLetter(s: String, t: String) -> Character {
  let sArray = Array(s)
  var tArray = Array(t)

  for char in sArray {
    if let index = tArray.firstIndex(of: char) {
      tArray.remove(at: index)
    }
  }
  return tArray.first!
}

let sString = readLine()!
let tString = readLine()!

print(findExtraLetter(s: sString, t: tString))
