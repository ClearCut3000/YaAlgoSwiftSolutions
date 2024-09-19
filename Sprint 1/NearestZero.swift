//
//  NearestZero.swift
//
// Поскольку все три цикла выполняются последовательно и каждый из них имеет сложность O(n), общая временная сложность алгоритма составляет:
// O(n)+O(n)=O(2n)=O(n)
// Пространственная сложность O(n).

import Foundation

let streetLen = Int(readLine()!)!
var houseNumbers = readLine()!.split(separator: " ").map { Int($0)! }

func calculateDistToZero(_ numbers: inout [Int], _ length: Int) {

  if length > 1 && numbers[0] != 0 { numbers[0] = length }

  for i in 1..<length {
    if numbers[i] != 0 {
      numbers[i] = numbers[i - 1] + 1
    }
  }
  for i in stride(from: length - 2, through: 0, by: -1) {
    if numbers[i] != 0 {
      numbers[i] = min(numbers[i + 1] + 1, numbers[i])
    }
  }
}

calculateDistToZero(&houseNumbers, streetLen)

print(houseNumbers.map(String.init).joined(separator: " "))
