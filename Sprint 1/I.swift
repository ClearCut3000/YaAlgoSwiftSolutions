// I. Степень четырёх

let number = Int(readLine()!)!

func powerOfFour(n: Int) -> String {
  switch n {
  case 0:
    return "False"
  case 1:
    return "True"
  default:
    if n % 4 != 0 {
      return "False"
    } else {
      return powerOfFour(n: n / 4)
    }
  }
}

print(powerOfFour(n: number))
