//  C. Соседи

func getNeighbors(matrix: [[Int]], row: Int, col: Int) -> [Int] {
  let numRows = matrix.count
  let numCols = matrix[0].count

  var neighbors = [Int]()

  //  left
  if col > 0 {
    neighbors.append(matrix[row][col - 1])
  }

  //  right
  if col < numCols - 1 {
    neighbors.append(matrix[row][col + 1])
  }

  //  top
  if row > 0 {
    neighbors.append(matrix[row - 1][col])
  }

  //  bottom
  if row < numRows - 1 {
    neighbors.append(matrix[row + 1][col])
  }

  return neighbors.sorted()
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var matrix = [[Int]]()
for _ in 0..<n {
  let row = readLine()!.split(separator: " ").map { Int($0)! }
  matrix.append(row)
}

let targetRow = Int(readLine()!)!
let targetCol = Int(readLine()!)!

let result = getNeighbors(matrix: matrix, row: targetRow, col: targetCol)
print(result
  .map { String($0) }
  .joined(separator: " ")
)

