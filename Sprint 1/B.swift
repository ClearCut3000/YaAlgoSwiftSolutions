// B. Чётные и нечётные числа

let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let areEven = (numbers[0] & 1) == 0
if numbers.allSatisfy { ($0 & 1 == 0) == areEven } {
  print("WIN")
} else {
  print("FAIL")
}
