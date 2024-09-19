// J. Факторизация

func factorize(_ number: Int) -> [Int] {
  var i = 2
  var result = [Int]()

  var number = number

  while i * i <= number {
    while number % i == 0 {
      result.append(i)
      number /= i
    }
    i += 1
  }

  if number > 1 {
    result.append(number)
  }

  return result
}

let number = Int(readLine()!)!
let result = factorize(number)
print(result.map(String.init).joined(separator: " "))

