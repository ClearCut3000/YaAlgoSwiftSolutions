// A. Значения функции

let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let y = (numbers[0] * (numbers[1] * numbers[1])) + (numbers[2] * numbers[1]) + numbers[3]
print(y)
