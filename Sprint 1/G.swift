// G. Работа из дома

let number = Int(readLine()!)!

func makeBinary(from number: Int) -> String {
  var binary = ""
  var num = number

  while num > 0 {
    binary = String(num % 2) + binary
    num /= 2
  }

  return binary.isEmpty ? "0" : binary
}

let binary = makeBinary(from: number)
print(binary)
