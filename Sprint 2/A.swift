
// A. Мониторинг

import Foundation

func transpose(matrix: [[Int]]) -> [[Int]] {
  guard !matrix.isEmpty else { return [] }

  let m = matrix.count
  let n = matrix[0].count
  var transposedMatrix = Array(repeating: Array(repeating: 0, count: m), count: n)

  for i in 0..<m {
    for j in 0..<n {
      transposedMatrix[j][i] = matrix[i][j]
    }
  }

  return transposedMatrix
}

func readMatrix() -> [[Int]] {
  guard let n = Int(readLine()!), let m = Int(readLine()!) else { return [] }

  var matrix: [[Int]] = []
  for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    matrix.append(row)
  }

  return matrix
}

let matrix = readMatrix()
let transposed = transpose(matrix: matrix)

for row in transposed {
  print(row.map { String($0) }.joined(separator: " "))
}
