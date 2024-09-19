// I. Анаграммная группировка

import Foundation

func groupAnagrams(_ strings: [String]) -> [[Int]] {
  var anagramGroups: [String: [Int]] = [:]
  
  for (index, str) in strings.enumerated() {
    let sortedStr = String(str.sorted())
    if anagramGroups[sortedStr] != nil {
      anagramGroups[sortedStr]?.append(index)
    } else {
      anagramGroups[sortedStr] = [index]
    }
  }
  
  let sortedGroups = anagramGroups.values.map { $0.sorted() }
    .sorted { $0.first! < $1.first! }
  return sortedGroups
}

let n = Int(readLine()!)!
let strings = readLine()!.split(separator: " ").map { String($0) }

let anagramGroups = groupAnagrams(strings)
for group in anagramGroups {
  print(group.map { String($0) }.joined(separator: " "))
}
