// D. Хаотичность погоды

let n = Int(readLine()!)!
let temperatures = readLine()!.split(separator: " ").map { Int($0)! }

func countRandomness(temperatures: [Int], n: Int) -> Int {

  if n <= 1 {
    return (1)
  }
  var randomness = 0

  for i in 1..<n-1 {
    if temperatures[i] > temperatures[i-1] && temperatures[i] > temperatures[i+1] {
      randomness += 1
    }
  }
  if temperatures[n-1] > temperatures[n - 2] {
    randomness += 1
  }
  if temperatures[0] > temperatures[1] {
    randomness += 1
  }
  return randomness
}
let result = countRandomness(temperatures: temperatures, n: n)
print(result)
