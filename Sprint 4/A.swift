//  A. Кружки

let n = Int(readLine()!)!
var interestGroupsSet = Set<String>()
var interestGroupsList = [String]()
for _ in 0..<n {
  let group = readLine()!
  if !interestGroupsSet.contains(group) {
    interestGroupsSet.insert(group)
    interestGroupsList.append(group)
  }
}

interestGroupsList.forEach { group in
  print(group)
}
