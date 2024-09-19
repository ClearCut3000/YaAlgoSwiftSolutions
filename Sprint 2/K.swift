// K. Рекурсивные числа Фибоначчи

func fibonacci(_ n: Int) -> Int {
  switch n {
  case 0, 1:
    return 1
  default:
    return fibonacci(n - 1) + fibonacci(n - 2)
  }
}

let n = Int(readLine()!)!
print(fibonacci(n))
