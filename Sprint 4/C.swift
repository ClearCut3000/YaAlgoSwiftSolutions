// C. Странное сравнение

import Foundation

func areStringsEqual(s: String, t: String) -> String {
  // Если длины строк разные, они не могут быть равны
  guard s.count == t.count else {
    return "NO"
  }

  var sToTMap = [Character: Character]()
  var tToSMap = [Character: Character]()

  let sChars = Array(s)
  let tChars = Array(t)

  for i in 0..<sChars.count {
    let sChar = sChars[i]
    let tChar = tChars[i]

    if let mappedChar = sToTMap[sChar] {
      // Если текущий символ s уже сопоставлен с другим символом t
      if mappedChar != tChar {
        return "NO"
      }
    } else {
      sToTMap[sChar] = tChar
    }

    if let mappedChar = tToSMap[tChar] {
      // Если текущий символ t уже сопоставлен с другим символом s
      if mappedChar != sChar {
        return "NO"
      }
    } else {
      tToSMap[tChar] = sChar
    }
  }

  return "YES"
}

let s = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)
let t = readLine()!.trimmingCharacters(in: .whitespacesAndNewlines)

let result = areStringsEqual(s: s, t: t)
print(result)
