//
//  ManualDexterity.swift
//
// Временная сложность: O(1)
// Пространственная сложность: O(1)

import Foundation

struct Matrix {
    var grid: [String]

    init(numberOfRows: Int) {
        self.grid = Array(repeating: "", count: numberOfRows)
    }

    mutating func readInput() {
        for i in 0..<4 {
            if let line = readLine() {
                self.grid[i] = line
            }
        }
    }

    func calculateScores(number: Int) -> Int {
        var counts = Array(repeating: 0, count: 10)
        var scores = 0

        for row in grid {
            for char in row {
                if char == "." {
                    continue
                }
                if let digit = Int(String(char)) {
                    counts[digit] += 1
                }
            }
        }

        for count in counts {
            if 0 < count && count <= 2 * number {
                scores += 1
            }
        }
        return scores
    }
}

func readInput() -> (Int, Matrix) {
    let number = Int(readLine()!)!
    var matrix = Matrix(numberOfRows: 4)
    matrix.readInput()
    return (number, matrix)
}

let (number, matrix) = readInput()
print(matrix.calculateScores(number: number))
